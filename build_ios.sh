#!/bin/sh

# ============================================================================
# 配置参数定义区域
# ============================================================================

# 应用基本信息
app_name="知鲜阁"
output_name="fridgerecorder"
version=""
version_code=""

# Widget扩展 Bundle ID（为空则跳过xcconfig修补）；也可用环境变量 WidgetBundleId 覆盖
widget_bundle_id=${WidgetBundleId:-"com.xdarren.fridgerecoder.widget"}

# 本地构建产物目录
local_build_dir="/Users/darrenyou/BuildPackages/app"

# Git分支相关
remote=${BuildBranch}

# 打包类型：ad-hoc（测试包）、app-store（市场包）
BuildType=${BuildType:-"app-store"}

# 产物路径
build_output_path="$(pwd)/build/ios/ipa/${output_name}.ipa"
symbols_path="build/symbols/ios"
artifact_timestamp=""

# Jenkins相关传入配置
build_id=${BUILD_NUMBER}
environment=${BuildEnv:-"test"}
tips=${BuildTips:-""}
pod_update=${BuildPodUpdate:-"false"}

# App Store配置
app_store_username="darren-you@outlook.com"
app_store_password="fxiy-tyqj-evsp-uhfv"

# ============================================================================
# 功能函数定义区域
# ============================================================================

# 修改Build号
update_build_version() {
    branch=${remote##*/}
    value=`git branch --list ${branch}`
    if [ "${value}" != "" ]
    then
        git checkout ${branch}
    else
        git checkout -b ${branch} ${remote}
    fi
    git pull
    git push --set-upstream origin ${branch}

    flutter pub run flutter_project_tool
    
    # 从pubspec.yaml中提取版本号和VersionCode
    version=$(grep "^version:" pubspec.yaml | sed 's/version: //' | sed 's/+.*//')
    version_code=$(grep "^version:" pubspec.yaml | sed 's/version: [0-9]*\.[0-9]*\.[0-9]*+//')
    echo ⚙️⚙️⚙️修改版本号: ${version}
    echo ⚙️⚙️⚙️VersionCode: ${version_code}
    
    git add .
    git commit -m "修改Build号为: ${version}"
    git push

    echo "修改已推送至git服务器"
}

# 企业微信机器人通知
send_notification() {
    local build_status=$1
    local branch_name=${remote##*/}
    
    # 产物绝对路径（用于通知显示）- iOS所有包都上传到版本号目录
    artifact_path="${local_build_dir}/${app_name}/ios/${version}/${app_name}_${BuildType}_V${version}_${version_code}_${environment}_${artifact_timestamp}.ipa"

    # 调用shell脚本发送通知
    sh $(dirname "$0")/notification_ios.sh \
        --version "${version}" \
        --version_code "${version_code}" \
        --branch_name "${branch_name}" \
        --build_id "${build_id}" \
        --artifact_path "${artifact_path}"\
        --channel "${BuildType}" \
        --build_status "${build_status}" \
        --tips "${tips}" \
        --environment "${environment}"
}

# 编译
build() {
    echo "🚀🚀🚀开始编译 ${BuildType} 包！！！"
    echo "Server环境：${environment}"
    
    # 根据Jenkins参数PodUpdate决定是否执行pod update
    if [ "${pod_update}" = "true" ]; then
        echo "📦📦📦开始执行pod update"
        cd ios
        pod update
        cd ..
        echo "✅✅✅pod update完成"
    else
        echo "⏭️⏭️⏭️跳过pod update（PodUpdate参数为false）"
    fi

    # 编译前修复widget的xcconfig继承，确保版本变量注入且不引入Pods链接
    bash tool/fix_widget_xcconfig.sh ios/Runner.xcodeproj/project.pbxproj "${widget_bundle_id}"

    # 构建ipa
    # 在app-store模式下明确传入导出配置，确保xcodebuild导出阶段匹配到正确的Profiles
    # 注意：--export-options-plist 与 --export-method 不能同时使用
    if [ "${BuildType}" = "app-store" ]; then
        export_options="--export-options-plist=ios/ExportOptions.plist"
        export_method_flag=""  # 使用导出配置时，不再传 --export-method
    else
        export_options=""
        export_method_flag="--export-method=${BuildType}"
    fi

    flutter build ipa \
        ${export_options} \
        ${export_method_flag} \
        --build-name=${version} \
        --build-number=${version_code} \
        --obfuscate \
        --split-debug-info=${symbols_path} \
        --dart-define=environment=${environment}

    build_result=$?

    if [ $build_result -eq 0 ]; then
        # 编译完成后生成时间戳
        artifact_timestamp=$(date +%y%m%d%H%M)
        echo "✅✅✅${BuildType}渠道${environment}环境包(V${version}_${version_code})编译完成！！！"
    else
        echo "❌❌❌${BuildType}渠道${environment}环境包(V${version}_${version_code})编译失败！！！"
        send_notification "failure"
        exit 1
    fi
}

# 上传至本地目录
upload_to_server() {
    # 确保本地构建目录存在
    app_dir="${local_build_dir}/${app_name}/ios"
    mkdir -p "${app_dir}"
    
    # 统一文件名格式
    file_name=${app_name}_${BuildType}_V${version}_${version_code}_${environment}_${artifact_timestamp}.ipa
    
    # iOS所有包都上传到版本号目录
    version_dir="${app_dir}/${version}"
    mkdir -p "${version_dir}"
    
    # 删除同版本同类型的旧包
    rm -f "${version_dir}/${app_name}_${BuildType}_V${version}_*_${environment}_*.ipa"
    cp "${build_output_path}" "${version_dir}/${file_name}"
    echo "✅✅✅${environment}环境：${BuildType}包已上传至${version}目录"
    echo "文件路径: ${version_dir}/${file_name}"

    send_notification "success"
    
    echo "✅✅✅${BuildType}包上传完成！！！"
}

# 上传到应用商店
upload_app_store() {
    echo ⏫⏫⏫开始上传ipa至AppStore
    xcrun altool -v -f ${build_output_path} -u ${app_store_username} -p ${app_store_password} -t ios --verbose
    xcrun altool --upload-app -f ${build_output_path} -t ios -u ${app_store_username} -p ${app_store_password} --verbose

    build_result=$?
    if [ $build_result -eq 0 ]; then
        echo ✅✅✅上传ipa至AppStore完成！！！
        send_notification "success"
    else
        echo "❌❌❌上传ipa至AppStore失败！！！"
        send_notification "failure"
    fi
}

main() {
	update_build_version

	build

    if [ "${BuildType}" == "ad-hoc" ]
    then
      upload_to_server
    fi

    if [ "${BuildType}" == "app-store" ]
    then
      upload_app_store
    fi
}

main

# ============================================================================
# 测试命令示例
# ============================================================================