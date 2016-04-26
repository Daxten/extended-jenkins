FROM jenkins

USER root
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install rpm fakeroot build-essential nodejs
USER jenkins 