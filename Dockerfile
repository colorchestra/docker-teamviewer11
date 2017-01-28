FROM debian:wheezy
MAINTAINER Konrad Lother <k@hiddenbox.org>

RUN useradd -m -d /home/teamviewer -s /bin/bash teamviewer
RUN dpkg --add-architecture i386 
RUN apt-get update 
RUN apt-get -y upgrade && apt-get -y dist-upgrade 
RUN apt-get clean
RUN apt-get -y install \
	sudo \
	wget \
	ca-certificates \
	gdebi
#	ia32-libs \
#	lib32asound2 

RUN wget http://download.teamviewer.com/download/version_10x/teamviewer_linux.deb -O /tmp/teamviewer.deb 
RUN wget http://download.teamviewer.com/download/version_10x/teamviewer_linux.tar.gz -O /tmp/teamviewer.tar.gz
#COPY teamviewer_linux.deb /tmp/teamviewer.deb
#COPY teamviewer_linux.tar.gz /tmp/teamviewer.tar.gz
RUN tar xzf tmp/teamviewer.tar.gz
RUN chown -R teamviewer: /teamviewer 
RUN gdebi -n /tmp/teamviewer.deb
RUN rm -rf /tmp/teamviewer*

RUN apt-get clean
RUN echo "teamviewer  ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/teamviewer \
&&  chmod 0440 /etc/sudoers.d/teamviewer


USER teamviewer
ENV USER teamviewer
ENV DISPLAY :0.0

#RUN sudo /etc/init.d/teamviewerd start \
#&&  sudo /usr/bin/teamviewer license accept


#CMD sudo /etc/init.d/teamviewerd start && /usr/bin/teamviewe
CMD /teamviewer/teamviewer 
