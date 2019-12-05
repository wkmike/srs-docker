# SRS

![](http://ossrs.net:8000/gif/v1/sls.gif?site=github.com&path=/docker/v2)
[![](https://cloud.githubusercontent.com/assets/2777660/22814959/c51cbe72-ef92-11e6-81cc-32b657b285d5.png)](https://github.com/ossrs/srs/wiki/v1_CN_Contact#wechat)

The docker images for [SRS](https://github.com/ossrs/srs).

## SRS2

For [SRS2](https://github.com/ossrs/srs/tree/2.0release) and [tags](https://github.com/ossrs/srs/tags).

To start SRS:

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:2
```

All right, you can:

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
    ossrs/srs:2
```

> Note: You should create the log file by ```mkdir -p /path/of && touch /path/of/yours.log```, then start SRS.

## Debug

For debuggging:

* Check files of docker: ```docker run -it ossrs/srs bash```
* Use gdb to debug SRS, please use [dev](https://github.com/ossrs/srs-docker/tree/dev#usage).

Winlin 2019.11
