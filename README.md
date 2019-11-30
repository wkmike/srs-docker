# SRS

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

## SRS3

For [SRS3](https://github.com/ossrs/srs/tree/3.0release) and [tags](https://github.com/ossrs/srs/tags).

To start SRS:

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:3
```

* config file: /usr/local/srs/conf/srs.conf
* log file: /usr/local/srs/objs/srs.log

To overwrite the config by `/path/of/yours.conf` and gather log to `/path/of/yours.log`:

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 \
    -v /path/of/yours.conf:/usr/local/srs/conf/srs.conf \
    -v /path/of/yours.log:/usr/local/srs/objs/srs.log \
    ossrs/srs:3
```

## Debug

For debuggging:

* Check files of docker: ```docker run -it ossrs/srs:3 bash```
* Use gdb to debug SRS, please use [dev](https://github.com/ossrs/srs-docker/tree/dev#usage).

Winlin 2019.11
