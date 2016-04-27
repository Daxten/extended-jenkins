FROM jenkins

USER root
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install -y rpm fakeroot build-essential nodejs
RUN mkdir /android && chown jenkins /android

USER jenkins 

# Install Android SDK
RUN cd /android && wget -nv https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xf android-sdk_r24.4.1-linux.tgz --no-same-permissions -C /android && chmod -R a+rX /android/android-sdk-linux
RUN rm -rf /android/android-sdk_r24.4.1-linux.tgz

# Install Android tools
# RUN echo y | /android/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a
# RUN echo y | /android/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a
# RUN echo y | /android/android-sdk-linux/tools/android update sdk --filter platform --no-ui --force -a
# RUN echo y | /android/android-sdk-linux/tools/android update sdk --filter build-tools-21.0.1 --no-ui -a
# RUN echo y | /android/android-sdk-linux/tools/android update sdk --filter sys-img-x86-android-18 --no-ui -a
# RUN echo y | /android/android-sdk-linux/tools/android update sdk --filter sys-img-x86-android-19 --no-ui -a
# RUN echo y | /android/android-sdk-linux/tools/android update sdk --filter sys-img-x86-android-21 --no-ui -a

ENV ANDROID_HOME /android/android-sdk-linux