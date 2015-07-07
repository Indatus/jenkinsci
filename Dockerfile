FROM jenkins:latest

ENV JAVA_OPTS -Duser.timezone=America/New_York

# Switch user to root so that we can install apps (jenkins image switches to user "jenkins" in the end)
USER root

# Install virtualbox (for Docker) https://wiki.debian.org/VirtualBox#Debian_8_.22Jessie.22
# Debian 8 "Jessie"
RUN echo 'deb http://http.debian.net/debian/ jessie main contrib' > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install virtualbox
RUN apt-cache search linux-headers
RUN apt-get -y install dkms build-essential linux-headers-3.16.0-4-all

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
