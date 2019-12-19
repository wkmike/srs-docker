# SRS

![](http://ossrs.net:8000/gif/v1/sls.gif?site=github.com&path=/docker/v3)
[![](https://cloud.githubusercontent.com/assets/2777660/22814959/c51cbe72-ef92-11e6-81cc-32b657b285d5.png)](https://github.com/ossrs/srs/wiki/v1_CN_Contact#wechat)

The docker images for [SRS](https://github.com/ossrs/srs).

<a name="srs3"></a>
<a name="usage"></a>
## Usage

For [SRS3](https://github.com/ossrs/srs/tree/3.0release) and [tags](https://github.com/ossrs/srs/tags).

Run SRS in docker by:

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:3
```

After SRS is running, you can:

* Publish stream to SRS by ```ffmpeg -re -i doc/source.200kbps.768x320.flv -c copy -f flv rtmp://127.0.0.1/live/livestream```
* Play stream from SRS by ```ffmpeg -f flv -i rtmp://127.0.0.1/live/livestream -f flv -y /dev/null```
* Access the console by [http://127.0.0.1:1985/console](http://127.0.0.1:1985/console)

The env of docker is bellow:

* config file: /usr/local/srs/conf/srs.conf
* log file: /usr/local/srs/objs/srs.log

To overwrite the config by `/path/of/yours.conf` and gather log to `/path/of/yours.log`:

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 \
    -v /path/of/yours.conf:/usr/local/srs/conf/srs.conf \
    -v /path/of/yours.log:/usr/local/srs/objs/srs.log \
    ossrs/srs:3
```

> Note: You should create the log file by ```mkdir -p /path/of && touch /path/of/yours.log```, then start SRS.

> Note: How to write the correct config file, please read wiki([CN](https://github.com/ossrs/srs/wiki/v3_CN_Home)/[EN](https://github.com/ossrs/srs/wiki/v3_EN_Home)).

## Aliyun

To use docker images in [AliyunCR](https://cr.console.aliyun.com/), 
please use `registry.cn-hangzhou.aliyuncs.com/ossrs/srs`.

For example:

```bash
docker run registry.cn-hangzhou.aliyuncs.com/ossrs/srs:3
```

> Note: Strongly recommend to use AliyunCR, because it's is much faster and has all [tags](https://hub.docker.com/repository/docker/ossrs/srs/tags?page=1).

## Origin Cluster

Download config and script files:

```bash
git clone https://github.com/ossrs/srs-docker.git &&
cd srs-docker/3.0
```

Start origin serverA:

```bash
HostIP=`./auto/get_host_ip.sh` &&
docker run -p 19350:19350 -p 9090:9090 --add-host=docker:${HostIP} \
    -v `pwd`/conf/origin.cluster.serverA.conf:/usr/local/srs/conf/srs.conf \
    ossrs/srs:3
```

Start origin serverB:

```bash
HostIP=`./auto/get_host_ip.sh` &&
docker run -p 19351:19351 -p 9091:9091 --add-host=docker:${HostIP} \
    -v `pwd`/conf/origin.cluster.serverB.conf:/usr/local/srs/conf/srs.conf \
    ossrs/srs:3
```

Start edge server:

```bash
HostIP=`./auto/get_host_ip.sh` &&
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 --add-host=docker:${HostIP} \
    -v `pwd`/conf/origin.cluster.edge.conf:/usr/local/srs/conf/srs.conf \
    ossrs/srs:3
```

Publish stream to edge server(or any origin server):

```bash
ffmpeg -re -i doc/source.200kbps.768x320.flv -c copy -f flv rtmp://127.0.0.1/live/livestream
```

Play stream from edge:

```bash
ffmpeg -f flv -i rtmp://127.0.0.1/live/livestream -f flv -y /dev/null
```

If now streaming to serverA, we can stop it then restart the publisher, 
then the edge will choose serverB and stream to it.

## FFMPEG

We copy the FFMEPG from [ossrs/srs:dev](https://github.com/ossrs/srs-docker/tree/dev),
and put to `/usr/local/srs/objs/ffmpeg/bin/ffmpeg` which is the default value of configs.

You can replace it by docker `-v`, for example:

```
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 \
    -v /path/of/ffmpeg:/usr/local/srs/objs/ffmpeg/bin/ffmpeg \
    ossrs/srs:2
```

> Remark: You can replace config, log and tools by specifying `-v` for each one.

## Debug

For debuggging:

* Check files of docker: ```docker run -it ossrs/srs bash```
* Use specified versions: ```docker run -it ossrs/srs:v3.0-a2 bash```
* Use gdb to debug SRS, please use [dev](https://github.com/ossrs/srs-docker/tree/dev#usage).

Winlin 2019.11
