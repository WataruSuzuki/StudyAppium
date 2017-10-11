#!/bin/sh

OUTPUTFOLDER_FOR_TESTING="appium-unittesting"
CONFIGURATION="Debug"
SCHEME_NAME="Sample_iOS"
XCODEPROJ_NAME="Sample_iOS.xcodeproj"

cd `dirname $0`

mkdir -p "${OUTPUTFOLDER_FOR_TESTING}"
xcodebuild -project "${XCODEPROJ_NAME}" -scheme ${SCHEME_NAME} -configuration ${CONFIGURATION} -sdk iphonesimulator BUILD_DIR="${OUTPUTFOLDER_FOR_TESTING}" clean build
