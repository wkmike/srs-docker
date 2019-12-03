# srs-docker

<img src='https://srs.cn-beijing.log.aliyuncs.com/logstores/ossrs-net/track_ua.gif?APIVersion=0.6.0&site=github.com&path=/docker/dev6'/>

CentOS docker for [SRS](https://github.com/ossrs/srs) developer.

## Usage

**Install docker**

Download docker from [here](https://www.docker.com/products/docker-desktop) then start docker.

**Build docker image**

```
docker pull ossrs/dev
```

> Remark: The image list is [here](https://hub.docker.com/r/ossrs/dev/tags).

**Clone SRS**

```
git clone https://github.com/ossrs/srs.git && cd srs
```

**Start docker**

```
docker run -it -v `pwd`:/tmp/srs -w /tmp/srs/trunk -p 1935:1935 \
  -p 1985:1985 -p 8080:8080 -p 8085:8085 ossrs/srs:dev6 bash
```

> Note: Recommend to use [AliyunCR](https://cr.console.aliyun.com/) `registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev6`, because it's much faster.

**Build SRS in docker**

```
./configure && make
```

**Run SRS in docker**

```
./objs/srs -c conf/console.conf
```

## EXEC

To enter your container:

```
dockerID=`docker ps --format "{{.ID}} {{.Image}}" |grep 'ossrs/srs:dev6' |awk '{print $1}'` &&
docker exec -it $dockerID bash
```

## GDB

To run docker with `--privileged` for GDB, or it fail for error `Cannot create process: Operation not permitted`.

## Api Server

To run api-server at 8085 in docker:

```
(cd objs/CherryPy-3.2.4 && python setup.py install --user) &&
python research/api-server/server.py 8085
```

## Features

- [x] v0.3, Go, dstat, lsb_release.
- [x] v0.2, NetTools, GDB.
- [x] v0.2, OpenSSL 1.1.0e
- [x] v0.1, FFMPEG 4.1 with x264 core.157
- [x] v0.1, GIT
