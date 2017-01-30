#!/bin/bash
docker pull lotherk/teamviewer10
TV_PROFILE="${HOME}/.teamviewer_profile"
HOSTNAME="$(hostname -s)-teamviewer10"

if [ ! -d "$TV_PROFILE" ]; then
	mkdir $TV_PROFILE
fi

#	-v ~/.teamviewer_profile:/teamviewer/profile \
echo docker run --privileged -t -i \
	-h $HOSTNAME \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $TV_PROFILE:/home/teamviewer/.config/teamviewer10 \
	lotherk/teamviewer10 $@
