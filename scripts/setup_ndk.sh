#!/bin/bash

ANDROID_NDK_HOME=${ANDROID_NDK_HOME:-/opt/android-ndk}
ANDROID_NDK_VERSION=${ANDROID_NDK_VERSION:-r19c}
NDK_URL=https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip

if [ ! -d "$ANDROID_NDK_HOME" ]; then
  mkdir /tmp/android-ndk
  curl -sL -o /tmp/android-ndk/ndk.zip "${NDK_URL}"
  cd /tmp/android-ndk && \
      unzip -q ndk.zip && \
      mv ./android-ndk-"${ANDROID_NDK_VERSION}" "${ANDROID_NDK_HOME}" && \
      rm -rf /opt/android-ndk-tmp
fi
