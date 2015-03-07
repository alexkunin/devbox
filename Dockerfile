FROM ubuntu:14.04

# Idea from http://nathanleclaire.com/blog/2014/07/12/10-docker-tips-and-tricks-that-will-make-you-sing-a-whale-song-of-joy/

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install vim -y
RUN apt-get install git -y
RUN apt-get install subversion -y
RUN apt-get install curl -y
RUN apt-get install man -y
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

RUN mkdir /var/shared/
RUN touch /var/shared/placeholder

WORKDIR /root
ADD . /root

RUN ln -s /var/shared/.ssh
RUN ln -s /var/shared/.bash_history
RUN ln -s /var/shared/.maintainercfg

CMD [ "/bin/bash", "-l" ]
