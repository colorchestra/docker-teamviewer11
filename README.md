# docker-teamviewer10

## pull
```
$ docker pull lotherk/teamviewer10
```

## build
```
$ docker build -t yourtag -f Dockerfile . 
```

Run with 

## first start
```
$ docker run --privileged -t -i --name teamviewer10 -h teamviewer10 -v /tmp/.X11-unix:/tmp/.X11-unix lotherk/teamviewer10
```

## from then one
```
$ docker start teamviewer10
```
