#!/bin/sh
set -ev

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=7.0,name=iPhone 4" \
                              test | xcpretty -c \
                              -freshInstall -freshSimulator

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=8.1,name=iPhone 5" \
                              test | xcpretty -c \
                              -freshInstall -freshSimulator

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=9.3,name=iPhone 6" \
                              test | xcpretty -c \
                              -freshInstall -freshSimulator
