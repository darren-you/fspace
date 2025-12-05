#!/bin/bash

# ============================================================================
# 配置参数定义区域
# ============================================================================

# 应用基本信息
app_name="知鲜阁"
version=""
version_code=""

# 本地构建产物目录
local_build_dir="/Users/darrenyou/BuildPackages/app"

# Git分支相关
remote=${BuildBranch}

# 渠道配置
build_channel=${BuildChannel:-"official"}
channels=(
    "official" 
    "huawei"
    "xiaomi"
    "oppo"
    "vivo"
    "honor"
    "kuaishou"
    "douyin"
)

# 产物路径
build_output_path="$(pwd)/build/app/outputs/flutter-apk/app-release.apk"
symbols_path="build/symbols/android"
artifact_timestamp=""

# Jenkins相关传入配置
build_id=${BUILD_NUMBER}
environment=${BuildEnv:-"test"}
tips=${BuildTips:-""}

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

# 钉钉机器人通知
send_notification() {
    local build_status=$1
    local channel=$2
    local branch_name=${remote##*/}
    
    # 产物绝对路径（用于通知显示）
    if [ "${environment}" == "test" ]; then
        artifact_path="${local_build_dir}/${app_name}/android/qa/${app_name}_V${version}_${version_code}_${environment}_${artifact_timestamp}.apk"
    else
        artifact_path="${local_build_dir}/${app_name}/android/channel/${version}/${app_name}_${channel}_V${version}_${version_code}_${environment}_${artifact_timestamp}.apk"
    fi

    # 调用shell脚本发送通知
    sh $(dirname "$0")/notification_android.sh \
        --version "${version}" \
        --version_code "${version_code}" \
        --branch_name "${branch_name}" \
        --build_id "${build_id}" \
        --artifact_path "${artifact_path}"\
        --channel "${channel}" \
        --build_status "${build_status}" \
        --tips "${tips}" \
        --environment "${environment}" 
}

# 编译
build() {
    local channel=$1
    echo "🚀🚀🚀开始编译 ${channel} 渠道包！！！"
    echo "Server环境：${environment}"
    
    # 构建APK
    flutter build apk \
        --build-name=${version} \
        --build-number=${version_code} \
        --obfuscate \
        --split-debug-info=${symbols_path} \
        --dart-define=CHANNEL=${channel} \
        --dart-define=environment=${environment}
    
    build_result=$?
        
    if [ $build_result -eq 0 ]; then
        # 编译完成后生成时间戳
        artifact_timestamp=$(date +%y%m%d%H%M)
        echo "✅✅✅${channel}渠道包编译完成！！！"
        upload_to_server ${channel} ${build_output_path}
        send_notification "success" ${channel}
    else
        echo "❌❌❌${channel}渠道包编译失败！！！"
        send_notification "failure" ${channel}
    fi
}

# 上传至本地目录
upload_to_server() {
    local channel=$1
    local apk_path=$2
    
    # 确保本地构建目录存在
    app_dir="${local_build_dir}/${app_name}/android"
    mkdir -p "${app_dir}"
    
    # 测试包文件名
    qa_file_name=${app_name}_V${version}_${version_code}_${environment}_${artifact_timestamp}.apk

    # 渠道包文件名
    channel_file_name=${app_name}_${channel}_V${version}_${version_code}_${environment}_${artifact_timestamp}.apk
    
    # 根据环境决定上传路径
    if [ "${environment}" == "test" ]; then
        # test环境：所有渠道包都上传到qa目录
        qa_dir="${app_dir}/qa"
        mkdir -p "${qa_dir}"
        cp "${apk_path}" "${qa_dir}/${qa_file_name}"
        echo "✅✅✅test环境：${channel}渠道包已上传至qa目录"
        echo "文件路径: ${qa_dir}/${qa_file_name}"
    elif [ "${environment}" == "prod" ]; then
        # prod环境：所有渠道包都上传到channel目录，按大版本号分目录
        channel_dir="${app_dir}/channel/${version}"
        mkdir -p "${channel_dir}"
        
        # 删除同版本同渠道的旧包
        rm -f "${channel_dir}/${app_name}_${channel}_V${version}_*_${environment}_*.apk"
        cp "${apk_path}" "${channel_dir}/${channel_file_name}"
        echo "✅✅✅prod环境：${channel}渠道包已上传至channel/${version}目录"
        echo "文件路径: ${channel_dir}/${channel_file_name}"
    else
        echo "❌❌❌未知环境：${environment}，仅支持test和prod"
        exit 1
    fi

    echo "✅✅✅${channel}渠道包上传完成！！！"
}

main() {
    update_build_version
    
    if [ "${build_channel}" == "all" ]; then
        # 打包所有渠道
        for channel in "${channels[@]}"
        do
            build ${channel}
        done
    else
        # 检查渠道是否有效
        channel_found=false
        for valid_channel in "${channels[@]}"; do
            if [ "$valid_channel" = "$build_channel" ]; then
                channel_found=true
                break
            fi
        done
        if [ "$channel_found" = "true" ]; then
            # 只打包指定渠道
            channel=${build_channel}
            build ${build_channel}
        else
            echo "❌错误：无效的渠道名 ${build_channel}"
            echo "可用渠道: ${channels[*]}"
            exit 1
        fi
    fi
}

main

# ============================================================================
# 测试命令示例
# ============================================================================

# 测试环境构建示例：
# export BuildBranch="origin/master"
# export BuildChannel="official"
# export BuildEnv="test"
# export BUILD_NUMBER="123"
# export BuildTips="测试构建"
# sh build_android.sh

# 生产环境构建示例：
# export BuildBranch="origin/main"
# export BuildChannel="official"
# export BuildEnv="prod"
# export BUILD_NUMBER="456"
# export BuildTips="正式发布"
# sh build_android.sh

# 构建所有渠道包：
# export BuildBranch="origin/main"
# export BuildChannel="all"
# export BuildEnv="prod"
# export BUILD_NUMBER="789"
# export BuildTips="全渠道发布"
# sh build_android.sh

# 构建指定渠道包：
# export BuildBranch="origin/develop"
# export BuildChannel="huawei"
# export BuildEnv="test"
# export BUILD_NUMBER="101"
# export BuildTips="华为渠道测试"
# sh build_android.sh