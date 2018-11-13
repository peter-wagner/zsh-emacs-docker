FROM ubuntu:18.10

# Locales
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8

# Common packages
RUN apt-get update && apt-get install -y \
      curl \
      git  \
      wget \
      zsh 
RUN chsh -s /usr/bin/zsh

# Install docker
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&\
      echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list &&\
      apt-get install -y apt-transport-https &&\
      apt-get update &&\
      apt-get install -y docker-engine
RUN  curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.13.0/docker-compose-$(uname -s)-$(uname -m)" &&\
     chmod +x /usr/local/bin/docker-compose
