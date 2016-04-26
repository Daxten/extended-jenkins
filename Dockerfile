FROM jenkins

USER root
RUN apt-get update && apt-get install -y rpm fakeroot
USER jenkins 