#!/bin/sh
set -ev

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -osx_image: xcode6.0
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=7.0,name=iPhone 4" \
                              test -freshInstall -freshSimulator | xcpretty -c \

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -osx_image: xcode7.3
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=8.1,name=iPhone 5" \
                              test -freshInstall -freshSimulator | xcpretty -c \

set -o pipefail && xcodebuild -workspace cdmx.xcworkspace \
                              -osx_image: xcode7.3
                              -scheme cdmx \
                              -sdk "iphonesimulator" \
                              -destination "platform=iOS Simulator,OS=9.3,name=iPhone 6" \
                              test -freshInstall -freshSimulator | xcpretty -c \
