#!/bin/bash
docker pull lotherk/teamviewer10
TV_PROFILE="${HOME}/.teamviewer_profile"

if [ ! -d "$TV_PROFILE" ]; then
	mkdir $TV_PROFILE
fi

#	-v ~/.teamviewer_profile:/teamviewer/profile \
docker run --rm --privileged -t -i \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	lotherk/teamviewer10 $@
