#!/bin/bash

# ============================================================================
# 配置参数定义区域
# ============================================================================

# 企业微信机器人配置
WECHAT_WEBHOOK_URL="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=89d782a7-67bd-468e-8024-3d2169fcb4d0"

# Jenkins配置
JENKINS_BASE_URL="https://jenkins.xdarren.com/job/知鲜阁-iOS/"

# 平台信息
PLATFORM="iOS"

# 消息配置
SUCCESS_TITLE="✅构建成功"
FAILURE_TITLE="❌构建失败"

# ============================================================================
# 命令行参数解析区域
# ============================================================================

# 解析命令行参数
while [[ $# -gt 0 ]]; do
  case $1 in
    --version)
      VERSION="$2"
      shift 2
      ;;
    --version_code)
      VERSION_CODE="$2"
      shift 2
      ;;
    --branch_name)
      BRANCH_NAME="$2"
      shift 2
      ;;
    --build_id)
      BUILD_ID="$2"
      shift 2
      ;;
    --artifact_path)
      ARTIFACT_PATH="$2"
      shift 2
      ;;
    --channel)
      CHANNEL="$2"
      shift 2
      ;;
    --build_status)
      BUILD_STATUS="$2"
      shift 2
      ;;
    --tips)
      TIPS="$2"
      shift 2
      ;;
    --environment)
      ENVIRONMENT="$2"
      shift 2
      ;;
    *)
      echo "未知参数: $1"
      exit 1
      ;;
  esac
done

# 检查必需参数
if [[ -z "$VERSION" ]] || [[ -z "$VERSION_CODE" ]] || [[ -z "$BRANCH_NAME" ]] || [[ -z "$BUILD_ID" ]] || [[ -z "$ARTIFACT_PATH" ]] || [[ -z "$CHANNEL" ]] || [[ -z "$BUILD_STATUS" ]] || [[ -z "$ENVIRONMENT" ]]; then
    echo "错误：所有参数都是必需的"
    echo "用法: $0 --version <版本> --version_code <版本代码> --branch_name <分支名> --build_id <构建ID> --artifact_path <产物路径> --channel <渠道> --build_status <构建状态> [--tips <备注信息>] --environment <构建环境>"
    exit 1
fi

# ============================================================================
# 功能函数定义区域
# ============================================================================

# 获取当前时间
BUILD_TIME=$(date '+%Y年%m月%d日 %H:%M')

# 根据构建状态设置标题
BUILD_RESULT_TITLE="$SUCCESS_TITLE"
if [ "$BUILD_STATUS" = "failure" ]; then
    BUILD_RESULT_TITLE="$FAILURE_TITLE"
fi

# 构建Jenkins链接
JENKINS_URL="${JENKINS_BASE_URL}/${BUILD_ID}/console"

# 构建消息内容
if [ "$BUILD_STATUS" = "failure" ]; then
    # 失败时不显示产物地址
    MESSAGE=$(cat <<EOF
{
    "msgtype": "markdown",
    "markdown": {
        "content": "### ${BUILD_RESULT_TITLE}：${BUILD_TIME}\n\n#### 🚀App版本：${VERSION}(${VERSION_CODE})\n\n#### 🔢构建ID：${BUILD_ID}\n\n#### 🌍Server环境：${ENVIRONMENT}\n\n#### 💻构建平台：${PLATFORM}\n\n#### 🌿构建分支：origin/${BRANCH_NAME}\n\n#### 📺构建渠道：${CHANNEL}\n\n#### 🏗️Jenkins：[查看构建任务](${JENKINS_URL})\n\n${TIPS:+#### 💬备注信息：${TIPS}}"
    }
}
EOF
)
else
    # 成功时显示产物地址
    MESSAGE=$(cat <<EOF
{
    "msgtype": "markdown",
    "markdown": {
        "content": "### ${BUILD_RESULT_TITLE}：${BUILD_TIME}\n\n#### 🚀App版本：${VERSION}(${VERSION_CODE})\n\n#### 🔢构建ID：${BUILD_ID}\n\n#### 🌍Server环境：${ENVIRONMENT}\n\n#### 💻构建平台：${PLATFORM}\n\n#### 🌿构建分支：origin/${BRANCH_NAME}\n\n#### 📺构建渠道：${CHANNEL}\n\n#### 📁产物地址：${ARTIFACT_PATH}\n\n#### 🏗️Jenkins：[查看构建任务](${JENKINS_URL})\n\n${TIPS:+#### 💬备注信息：${TIPS}}"
    }
}
EOF
)
fi

# 打印调试信息
echo "时间: ${BUILD_TIME}"
echo "消息内容: $MESSAGE"

# 发送请求
echo "发送请求..."
RESPONSE=$(curl -s -H "Content-Type: application/json" \
    -X POST \
    "${WECHAT_WEBHOOK_URL}" \
    -d "$MESSAGE")

echo "响应结果: $RESPONSE"


# 失败
# sh notification_ios.sh --version "1.0.0" --version_code "100000092" --branch_name "main" --build_id "123" --artifact_path "path/to/artifact" --channel "ad-hoc" --build_status "failure" --tips "☹️失败推送测试" --environment "test"

# 成功
# sh notification_ios.sh --version "1.0.0" --version_code "100000092" --branch_name "main" --build_id "123" --artifact_path "path/to/artifact" --channel "ad-hoc" --build_status "success" --tips "🏅成功推送测试" --environment "test"