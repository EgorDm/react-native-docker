ANDROID_HOME=${ANDROID_HOME:-/opt/android-sdk}
ANDROID_VERSION=${ANDROID_VERSION:-28}
ANDROID_BUILD_TOOLS_VERSION=${ANDROID_BUILD_TOOLS_VERSION:-28.0.3}
SDK_URL=https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip

# Get SDK Manager
if [ ! -d "$ANDROID_HOME" ]; then
  mkdir -p "$ANDROID_HOME"
  curl -sL -o "/tmp/android.zip" ${SDK_URL}
  unzip "/tmp/android.zip" -d "$ANDROID_HOME" && rm "/tmp/android.zip"
  yes | "$ANDROID_HOME/tools/bin/sdkmanager" --sdk_root="$ANDROID_HOME" --licenses

  # Andorid SDK & Platform
  "$ANDROID_HOME/tools/bin/sdkmanager" --sdk_root="$ANDROID_HOME" --update
  "$ANDROID_HOME/tools/bin/sdkmanager" --sdk_root="$ANDROID_HOME" "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
      "platforms;android-${ANDROID_VERSION}" \
      "platform-tools"
fi

GRADLE_VERSION=${GRADLE_VERSION:-6.5.1}
GRADLE_PATH=${GRADLE_PATH:-/opt/gradle}
GRADLE_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"

if [ ! -d "$GRADLE_PATH" ]; then
  curl -sL -o "/tmp/gradle.zip" "$GRADLE_URL" && \
    mkdir /opt/gradle && unzip -d "$GRADLE_PATH" "/tmp/gradle.zip" && rm "/tmp/gradle.zip"
fi

MAVEN_VERSION=${MAVEN_VERSION:-3.6.3}
MAVEN_PATH=${MAVEN_PATH:-/opt/maven}
MAVEN_URL="https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip"

if [ ! -d "MAVEN_PATH" ]; then
  curl -sL -o "/tmp/maven.zip" "$MAVEN_URL" && \
    mkdir /opt/maven && unzip -d "$MAVEN_PATH" "/tmp/maven.zip" && rm "/tmp/maven.zip"
fi
