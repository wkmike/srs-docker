# SRS

![](https://ossrs.net:8443/gif/v1/sls?https://srs.cn-beijing.log.aliyuncs.com/logstores/ossrs-net/track_ua.gif?APIVersion=0.6.0&site=github.com&path=/docker/v2)
[![](https://cloud.githubusercontent.com/assets/2777660/22814959/c51cbe72-ef92-11e6-81cc-32b657b285d5.png)](https://github.com/ossrs/srs/wiki/v1_CN_Contact#wechat)

The docker images for [SRS](https://github.com/ossrs/srs).

## SRS2

For [SRS2](https://github.com/ossrs/srs/tree/2.0release) and [tags](https://github.com/ossrs/srs/tags).

To start SRS:

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:2
```

* config file: /usr/local/srs/conf/srs.conf
* log file: /usr/local/srs/objs/srs.log

To overwrite the config by `/path/of/yours.conf` and gather log to `/path/of/yours.log`:

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 \
    -v /path/of/yours.conf:/usr/local/srs/conf/srs.conf \
    -v /path/of/yours.log:/usr/local/srs/objs/srs.log \
    ossrs/srs:2
```

> Note: You should create the log file by ```mkdir -p /path/of && touch /path/of/yours.log```, then start SRS.

## Debug

For debuggging:

* Check files of docker: ```docker run -it ossrs/srs bash```
* Use gdb to debug SRS, please use [dev](https://github.com/ossrs/srs-docker/tree/dev#usage).

Winlin 2019.11
