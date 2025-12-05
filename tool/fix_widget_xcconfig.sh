#  在 project.pbxproj 中定位 Flutter/Generated.xcconfig 的 PBXFileReference ID 。
#  找到目标为 com.xdarren.fridgerecoder.widget 的三个 XCBuildConfiguration （Debug/Release/Profile）。
#  将这三个配置的 baseConfigurationReference 重写为 Generated.xcconfig 的 ID。
#  仅对 Widget 目标生效，不影响主 App。

#!/usr/bin/env bash
set -euo pipefail

PBXPROJ_PATH=${1:-ios/Runner.xcodeproj/project.pbxproj}
BUNDLE_ID=${2:-""}

if [ ! -f "$PBXPROJ_PATH" ]; then
  echo "project.pbxproj not found: $PBXPROJ_PATH"
  exit 1
fi

if [ -z "$BUNDLE_ID" ]; then
  echo "⏭️⏭️⏭️ Skip: empty widget bundle id"
  exit 0
fi

GEN_ID=$(awk '
  /Begin PBXFileReference section/ {s=1; next}
  /End PBXFileReference section/ {s=0}
  s && /Flutter\/Generated\.xcconfig/ {
    if (match($0, /^[[:space:]]*[A-F0-9]{24}/)) {
      print substr($0, RSTART, RLENGTH); exit
    }
  }
' "$PBXPROJ_PATH")

if [ -z "${GEN_ID}" ]; then
  echo "PBXFileReference for Flutter/Generated.xcconfig not found."
  exit 2
fi

TMP_FILE=$(mktemp)
awk -v BID="$BUNDLE_ID" -v GID="$GEN_ID" '
function is_block_start(line) { return line ~ /^[[:space:]]*[A-F0-9]{24}[[:space:]]*\/\*.*\*\/[[:space:]]*=[[:space:]]*\{/ }
BEGIN { in_block=0; block="" }
{
  if (!in_block && is_block_start($0)) { in_block=1; block=$0 "\n"; next }
  if (in_block) {
    block = block $0 "\n";
    if ($0 ~ /^[[:space:]]*};[[:space:]]*$/) {
      if (block ~ /isa = XCBuildConfiguration;/ && block ~ ("PRODUCT_BUNDLE_IDENTIFIER = " BID ";")) {
        gsub(/baseConfigurationReference = [A-F0-9]{24} [^;]*;/, "baseConfigurationReference = " GID " /* Generated.xcconfig */;", block)
      }
      printf "%s", block;
      in_block=0; block="";
    }
    next
  }
  print
}
' "$PBXPROJ_PATH" > "$TMP_FILE"

mv "$TMP_FILE" "$PBXPROJ_PATH"
echo "🔧🔧🔧修改 widget baseConfigurationReference to Generated.xcconfig for $BUNDLE_ID ✅"