#!/bin/sh
set -ev

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=8.1,name=iPhone 5" \
                              test -freshInstall -freshSimulator | xcpretty -c \

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=9.3,name=iPhone 6" \
                              test -freshInstall -freshSimulator | xcpretty -c \
