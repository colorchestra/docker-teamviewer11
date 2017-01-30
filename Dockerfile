FROM debian:wheezy
MAINTAINER Konrad Lother <k@hiddenbox.org>

ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :0.0

RUN useradd -m -d /home/teamviewer -s /bin/bash teamviewer

RUN dpkg --add-architecture i386 
RUN apt-get update 
RUN apt-get -y upgrade && apt-get -y dist-upgrade 
RUN apt-get install -y wget ca-certificates
RUN wget http://download.teamviewer.com/download/version_10x/teamviewer_linux.tar.gz -O /tmp/teamviewer.tar.gz

RUN apt-get -y install \
	sudo \
	libasound2:i386 \
	libexpat1:i386 \
	libfontconfig1:i386 \
	libfreetype6:i386 \
	libice6:i386 \
	libjpeg8:i386 \
	libpng12-0:i386 \
	libsm6:i386 \
	libx11-6:i386 \
	libxau6:i386 \
	libxcb1:i386 \
	libxdamage1:i386 \
	libxdmcp6:i386 \
	libxext6:i386 \
	libxfixes3:i386 \
	libxi6:i386 \
	libxrandr2:i386 \
	libxrender1:i386 \
	libxtst6:i386 \
	x11-common


RUN tar xzf tmp/teamviewer.tar.gz
RUN /teamviewer/tv-setup install force
RUN rm -rf /teamviewer
RUN chown teamviewer: /var/lock/teamviewerd
RUN chown teamviewer: /opt/teamviewer
RUN /etc/init.d/teamviewerd start && /usr/bin/teamviewer license accept

RUN apt-get autoremove --purge -y
RUN apt-get clean
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN echo "teamviewer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/teamviewer \
&&  chmod 0440 /etc/sudoers.d/teamviewer

USER teamviewer
ENV USER teamviewer

CMD sudo /etc/init.d/teamviewerd start && /usr/bin/teamviewer
