ARG ANDROID_API_VERSION="android-34"

FROM gorapidio/android-fastlane:${ANDROID_API_VERSION}

ARG FLUTTER_VERSION=3.19.4
RUN test -n "$FLUTTER_VERSION"

ENV FLUTTER_HOME=$HOME/flutter \
    FLUTTER_ROOT=$HOME/flutter \
    FLUTTER_VERSION=$FLUTTER_VERSION

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

USER root
RUN apt-get update -y \
    && apt-get install -y gpg \
    && wget https://dl-ssl.google.com/linux/linux_signing_key.pub \
        -O /tmp/google.pub \
    && gpg --no-default-keyring \
        --keyring /etc/apt/keyrings/google-chrome.gpg \
        --import /tmp/google.pub \
    && echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update -y \
    && apt-get install -y google-chrome-stable \
    && apt-cache search libstdc++ \
    && apt-get install -y \
        clang \
        cmake \
        ninja-build \
        pkg-config \
        libgtk-3-dev \
        liblzma-dev \
        libstdc++-12-dev \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*

USER docker

RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz -O /tmp/flutter.tar.xz \
    && tar -xvf /tmp/flutter.tar.xz -C ~/.local/

ENV PATH=$HOME/.local/flutter/bin:${PATH}

WORKDIR /app
