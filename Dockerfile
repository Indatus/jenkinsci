FROM jenkins:latest
MAINTAINER tharvey@indatus.com

# Debian 8 "Jessie"
# https://wiki.debian.org/VirtualBox#Debian_8_.22Jessie.22

ENV JAVA_OPTS -Duser.timezone=America/New_York

# Switch user to root so that we can install apps (jenkins image switches to user "jenkins" in the end)
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

# Add jenkins user to the Docker group
RUN gpasswd -a jenkins docker

# Switch user back to jenkins
USER jenkins
