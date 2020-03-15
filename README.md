# srs-docker

![](http://ossrs.net:8000/gif/v1/sls.gif?site=github.com&path=/docker/rtc)
[![](https://cloud.githubusercontent.com/assets/2777660/22814959/c51cbe72-ef92-11e6-81cc-32b657b285d5.png)](https://github.com/ossrs/srs/wiki/v1_CN_Contact#wechat)

CentOS docker for [SRS](https://github.com/ossrs/srs) RTC developer.

## Usage

**Install docker**

Download docker from [here](https://www.docker.com/products/docker-desktop) then start docker.

**Clone SRS**

```
git clone https://github.com/ossrs/srs.git && cd srs
```

**Start docker**

```
git checkout feature/srt &&
HostIP=`bash auto/get_host_ip.sh` &&
echo "http://$HostIP:8080/players/rtc_player.html" &&
docker run -it -v `pwd`:/tmp/srs -w /tmp/srs/trunk -p 1935:1935 \
  -p 1985:1985 -p 8080:8080 -p 8085:8085 -p 8000:8000/udp --env CANDIDATE=$HostIP \
  registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev bash
```

> Note: You can also use `ossrs/srs:dev` from docker hub.

**Build and start SRS in docker**

```
./configure && make &&
./objs/srs -c conf/rtc.conf
```

Open in chrome: http://192.168.1.4:8080/players/rtc_player.html

> Remark: Replace by your docker host server IP.

## EXEC

To enter your container:

```
dockerID=`docker ps --format "{{.ID}} {{.Image}}" |grep 'ossrs/srs:dev' |awk '{print $1}'` &&
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
