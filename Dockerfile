FROM jenkins

USER root
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install -y rpm fakeroot build-essential nodejs expect
RUN mkdir /android && chown jenkins /android

USER jenkins 

ENV ANDROID_HOME /var/jenkins_home/android