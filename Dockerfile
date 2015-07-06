FROM jenkins:latest

ENV JAVA_OPTS -Duser.timezone=America/New_York

USER root
RUN apt-get update

# Install docker
RUN wget -qO- https://get.docker.com/ | sh

# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install docker-machine
RUN curl -L https://github.com/docker/machine/releases/download/v0.3.0/docker-machine_linux-386 > /usr/local/bin/docker-machine
RUN chmod +x /usr/local/bin/docker-machine

USER jenkins
