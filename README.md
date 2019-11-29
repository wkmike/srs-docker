# SRS

The docker images for [SRS](https://github.com/ossrs/srs).

## SRS2

For [SRS2](https://github.com/ossrs/srs/tree/2.0release) and [tags](https://github.com/ossrs/srs/tags).

To start SRS by [srs.conf](https://github.com/ossrs/srs-docker/blob/master/2.0/srs.conf):

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:2
```

To overwrite the config by `/path/of/yours.conf`:

```bash
docker run -v /path/of/yours.conf:/usr/local/srs/conf/srs.conf \
    -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:2
```

Or mount a config directory and use `/path/of/yours.conf`:

```bash
docker run -v /path/of:/usr/local/srs/conf/ \
    -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:2 ./objs/srs -c conf/yours.conf
```

## SRS3

For [SRS3](https://github.com/ossrs/srs/tree/3.0release) and [tags](https://github.com/ossrs/srs/tags).

To start SRS by [srs.conf](https://github.com/ossrs/srs-docker/blob/master/3.0/srs.conf):

```bash
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:3
```

To overwrite the config by `/path/of/yours.conf`:

```bash
docker run -v /path/of/yours.conf:/usr/local/srs/conf/srs.conf \
    -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:3
```

Or mount a config directory and use `/path/of/yours.conf`:

```bash
docker run -v /path/of:/usr/local/srs/conf/ \
    -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:3 ./objs/srs -c conf/yours.conf
```

## Debug

For debuggging:

* Check files of docker: ```docker run -it ossrs/srs:3 bash```
* Use gdb to debug SRS, please use [dev](https://github.com/ossrs/srs-docker/tree/dev#usage).

Winlin 2019.11
