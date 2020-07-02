FROM debian:buster-20200607-slim

RUN apt update && apt install -y --no-install-recommends build-essential curl unzip

# Java
COPY ./scripts/setup_java.sh /scripts/setup_java.sh
RUN /scripts/setup_java.sh

# Node
COPY ./scripts/setup_node.sh /scripts/setup_node.sh
RUN /scripts/setup_node.sh

# Android NDK
COPY ./scripts/setup_ndk.sh /scripts/setup_ndk.sh
ARG ANDROID_NDK_VERSION
ENV ANDROID_NDK_HOME=${ANDROID_NDK_HOME:-/opt/android-ndk}
ENV ANDROID_NDK_VERSION=${ANDROID_NDK_VERSION:-r19c}
RUN bash /scripts/setup_ndk.sh

# Android SDK
COPY ./scripts/setup_sdk.sh /scripts/setup_sdk.sh
ARG ANDROID_VERSION
ARG ANDROID_BUILD_TOOLS_VERSION
ARG GRADLE_VERSION
ARG MAVEN_VERSION
ENV ANDROID_HOME=${ANDROID_HOME:-/opt/android-sdk}
ENV ANDROID_VERSION=${ANDROID_VERSION:-28}
ENV ANDROID_BUILD_TOOLS_VERSION=${ANDROID_BUILD_TOOLS_VERSION:-28.0.3}
ENV GRADLE_PATH=${GRADLE_PATH:-/opt/gradle}
ENV GRADLE_VERSION=${GRADLE_VERSION:-6.5.1}
ENV MAVEN_PATH=${MAVEN_PATH:-/opt/maven}
ENV MAVEN_VERSION=${MAVEN_VERSION:-3.6.3}
RUN bash /scripts/setup_sdk.sh

# Add to bash rc
RUN export PATH=$PATH:$ANDROID_HOME/emulator\
    && export PATH=$PATH:$ANDROID_HOME/tools\
    && export PATH=$PATH:$ANDROID_HOME/tools/bin\
    && export PATH=$PATH:${GRADLE_PATH}/gradle-${GRADLE_VERSION}/bin\
    && export PATH=$PATH:${MAVEN_PATH}/apache-maven-${MAVEN_VERSION}/bin\
    && echo PATH=$PATH:$ANDROID_HOME/platform-tools>>/etc/bash.bashrc

RUN mkdir /work
WORKDIR /work
