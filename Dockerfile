FROM jenkins

USER root
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - \
    && rpm fakeroot build-essential nodejs
USER jenkins 