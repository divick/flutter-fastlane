#!/bin/bash

_usage="
Usage: TARGET_SDK=[27|28|29|30|31|32|33|34] FLUTTER_VERSION=stable|beta ./bin/build-image.sh
"
if [[ ! -v TARGET_SDK ]]; then
  echo "Please specify TARGET_SDK to build.";
  echo "$_usage";
  exit;
elif [[ -z "${TARGET_SDK}" ]]; then
  echo "TARGET_SDK cannot be empty. Please specify TARGET_SDK to build";
  echo "$_usage";
  exit;
else
    target=${TARGET_SDK}
fi
docker build --build-arg flutter_version=$FLUTTER_VERSION -t gorapidio/flutter-fastlane -f android-${target}/Dockerfile android-${target}/
