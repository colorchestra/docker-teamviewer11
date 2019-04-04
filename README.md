# docker-teamviewer11

For all of us poor souls that still have to use Teamviewer 11.

## clone
```
$ git clone https://github.com/colorchestra/docker-teamviewer11
```

## build
```
$ docker build -t yourtag -f Dockerfile . 
```

## first start
```
$ docker run --privileged -t -i --name teamviewer11 -h teamviewer11 -v /tmp/.X11-unix:/tmp/.X11-unix teamviewer11
```

## from then on
```
$ docker start teamviewer11
```

## integrate it with your system (Linux)
First create an executable in you PATH so you can start teamviewer normally, then create a Desktop file so it shows up in your applications menu / launcher

```
$ sudo cat <<EOF > /usr/bin/teamviewer11
> #!/bin/sh
> docker start teamviewer11
> EOF

$ cat <<EOF > ~/.local/share/applications/teamviewer11.desktop
> [Desktop Entry]
> Version=1.0
> Encoding=UTF-8
> Type=Application
> Categories=Network;

> Name=TeamViewer 11
> Comment=Remote control and meeting solution.
> Exec=/usr/bin/teamviewer11
> Icon=TeamViewer
> EOF
```
