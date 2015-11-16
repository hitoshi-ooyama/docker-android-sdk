FROM arimakouyou/openjdk7
maintainer Hitoshi.Ooyama<hitoshi.ooyama@gmo-gc.com>

ENV ANDROID_HOME=/usr/local/src/android-sdk-linux
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y install lib32stdc++6 lib32z1 lib32z1-dev ruby ant \
 && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
RUN curl --location http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz | tar -x -z -C /usr/local/src \
 && echo "y" |android update sdk --force --no-ui --all --filter tools,platform-tools,build-tools-22.0.0,android-22,android-8,android-17,android-16,build-tools-19.1.0,android-13,android-9,build-tools-23.0.1,android-23,extra-android-support,extra-android-m2repository,extra-google-m2repository
