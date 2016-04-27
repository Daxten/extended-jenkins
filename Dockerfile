FROM jenkins

USER root
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install -y rpm fakeroot build-essential nodejs expect
RUN mkdir /android && chown jenkins /android

USER jenkins 

# Install Android SDK
RUN cd /android && wget -nv https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xf android-sdk_r24.4.1-linux.tgz --no-same-permissions -C /android && chmod -R a+rX /android/android-sdk-linux
RUN rm -rf /android/android-sdk_r24.4.1-linux.tgz

# Install Android tools

RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android/android-sdk-linux/tools/android update sdk -u -a --filter platform-tool,android-22,android-23,sys-img-x86-android-22,sys-img-x86-android-23,build-tools-23.0.3;


ENV ANDROID_HOME /android/android-sdk-linux