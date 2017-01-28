FROM debian:wheezy
RUN dpkg --add-architecture i386 && apt-get update \
&&  apt-get -y upgrade && apt-get -y dist-upgrade \
&&  apt-get -y install sudo wget ia32-libs lib32asound2 \
&&  wget http://download.teamviewer.com/download/version_10x/teamviewer_amd64.deb -O /tmp/teamviewer.deb \
&&  (dpkg -i /tmp/teamviewer.deb || true) \
&&  apt-get -y -f install \
&&  dpkg -i /tmp/teamviewer.deb 

RUN echo "teamviewer  ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/teamviewer \
&&  chmod 0440 /etc/sudoers.d/teamviewer

RUN /etc/init.d/teamviewerd start && /usr/bin/teamviewer license accept

RUN useradd -m -d /home/teamviewer -s /bin/bash teamviewer

USER teamviewer
ENV USER teamviewer
ENV DISPLAY :0.0

CMD sudo /etc/init.d/teamviewerd start && /usr/bin/teamviewer
