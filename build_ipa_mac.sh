#!/usr/bin/env bash
# Ghost-WDA: 1-Click Local Mac IPA Builder
# Usage: ./build_ipa_mac.sh

set -e

echo "=== BUILDING GHOST-WDA CLEAN RUNNER FOR iOS 18 ==="

# 1. Clean build directory
rm -rf ./build Payload GhostRunner_iOS18.ipa

# 2. Compile using xcodebuild
xcodebuild build-for-testing \
  -project WebDriverAgent.xcodeproj \
  -scheme WebDriverAgentRunner \
  -destination "generic/platform=iOS" \
  -configuration Release \
  CODE_SIGNING_ALLOWED=NO \
  CODE_SIGNING_REQUIRED=NO \
  CODE_SIGN_IDENTITY="" \
  -derivedDataPath ./build

# 3. Packaging into .ipa
mkdir -p Payload
find ./build -name "WebDriverAgentRunner-Runner.app" -exec cp -r {} Payload/GhostRunner.app \;

zip -r GhostRunner_iOS18.ipa Payload
rm -rf Payload

echo "=========================================================="
echo " [SUCCESS] GhostRunner_iOS18.ipa created successfully!"
echo " Ready to sign and install via Sideloadly / AltStore / P12!"
echo "=========================================================="
