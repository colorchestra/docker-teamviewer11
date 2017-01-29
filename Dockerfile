FROM debian:wheezy
MAINTAINER Konrad Lother <k@hiddenbox.org>

RUN useradd -m -d /home/teamviewer -s /bin/bash teamviewer

RUN dpkg --add-architecture i386 
RUN apt-get update 
RUN apt-get -y upgrade && apt-get -y dist-upgrade 
RUN apt-get -y install \
	wget \
	ca-certificates \
	libasound2:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libice6:i386 libjpeg8:i386 libpng12-0:i386 libsm6:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdamage1:i386 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxi6:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 x11-common

RUN wget http://download.teamviewer.com/download/version_10x/teamviewer_linux.tar.gz -O /tmp/teamviewer.tar.gz
RUN tar xzf tmp/teamviewer.tar.gz
RUN chown -R teamviewer: /teamviewer 
RUN rm -rf /tmp/teamviewer*

RUN apt-get autoremove --purge -y
RUN apt-get clean


USER teamviewer
ENV USER teamviewer
ENV DISPLAY :0.0

CMD /teamviewer/teamviewer 
