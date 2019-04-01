# docker-teamviewer11

## clone
```
$ git clone https://github.com/colorchestra/docker-teamviewer11
```

## build
```
$ docker build -t yourtag -f Dockerfile . 
```

Run with 

## first start
```
$ docker run --privileged -t -i --name teamviewer11 -h teamviewer11 -v /tmp/.X11-unix:/tmp/.X11-unix teamviewer11
```

## from then on
```
$ docker start teamviewer11
```
