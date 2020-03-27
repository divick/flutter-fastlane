ARG ANDROID_API_VERSION="android-29"

FROM gorapidio/android-fastlane:${ANDROID_API_VERSION}

ARG flutter_version=stable
RUN test -n "$flutter_version"

ENV FLUTTER_HOME=/opt/flutter \
    FLUTTER_ROOT=$FLUTTER_HOME \
    FLUTTER_VERSION=$flutter_version

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

RUN apt-get update \
    && apt-get install -y curl

RUN git clone --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME} \
    && flutter doctor
