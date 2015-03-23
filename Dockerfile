FROM ubuntu:14.04

RUN apt-get update

# Idea from http://nathanleclaire.com/blog/2014/07/12/10-docker-tips-and-tricks-that-will-make-you-sing-a-whale-song-of-joy/

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install vim -y
RUN apt-get install git -y
RUN apt-get install subversion -y
RUN apt-get install curl -y
RUN apt-get install php5-cli -y
RUN apt-get install man -y
RUN apt-get install python3-pip -y
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

WORKDIR /root
ADD . /root

RUN curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

CMD [ "/bin/bash", "-l" ]
