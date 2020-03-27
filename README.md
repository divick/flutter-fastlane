# flutter-fastlane

## What is this image for?

  Use this image to have required tools like JAVA, android sdk and build tools,
  ruby and fastlane preinstalled for building flutter based apps.

  You can use this image for your gitlab or other CI/CD builds too.

## Requirements

  * docker version 18.09 or above

## How Tos

### Build the docker image

#### Using helper script in bin directory, for a given TARGET_SDK

```
TARGET_SDK=28 ./bin/build-image.sh
```

#### To override the [flutter_version] versions
```
docker build --build-arg flutter_version=stable|beta -t <whatever-tag> -f android-<sdk-version>/Dockerfile android-<sdk-version>/
```
