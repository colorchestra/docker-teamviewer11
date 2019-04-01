FROM i386/debian:wheezy
MAINTAINER morph <github@morph.sh>

ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :0.0

RUN useradd -m -d /home/teamviewer -s /bin/bash teamviewer

# RUN rm /etc/apt/sources.list # needed?
ADD sources.list /etc/apt/sources.list
RUN apt-get update 
RUN apt-get -y upgrade && apt-get -y dist-upgrade 
RUN apt-get install -y wget ca-certificates

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
	libjpeg62:i386 \
    libdbus-1-3:i386 \
	libasound2 \
	libsm6 \
	libxfixes3 \
	libxinerama1:i386 \
	x11-common

RUN wget https://download.teamviewer.com/download/version_11x/teamviewer_i386.tar.xz -O /tmp/teamviewer.tar.xz
RUN tar xf tmp/teamviewer.tar.xz
RUN chown -R teamviewer: /teamviewer /home/teamviewer

RUN apt-get autoremove --purge -y
RUN apt-get clean
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN echo "teamviewer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/teamviewer \
&&  chmod 0440 /etc/sudoers.d/teamviewer

ADD run.sh /run.sh

USER teamviewer
ENV USER teamviewer

CMD /run.sh
