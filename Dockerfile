FROM ubuntu:14.04

# Idea from http://nathanleclaire.com/blog/2014/07/12/10-docker-tips-and-tricks-that-will-make-you-sing-a-whale-song-of-joy/

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install vim -y
RUN apt-get install git -y
RUN apt-get install subversion -y
RUN apt-get install curl -y
RUN apt-get install man -y
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

RUN useradd dev

RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R dev:dev /var/shared
VOLUME /var/shared

RUN mkdir /home/dev
WORKDIR /home/dev
ENV HOME /home/dev
ADD . /home/dev/

RUN ln -s /var/shared/.ssh
RUN ln -s /var/shared/.bash_history
RUN ln -s /var/shared/.maintainercfg

RUN chown dev: -R /home/dev

RUN echo dev ALL = NOPASSWD : ALL > /etc/sudoers.d/dev

USER dev

CMD [ "/bin/bash", "-l" ]
