srs
===
A dockerized [SRS](https://github.com/ossrs/srs).
This is a much better solution than Wowza or Adobe Flash Media Server.
It allows for sophisticated custom live streaming setups.

Usage
---
```
docker pull ossrs/srs:[tag]
```

### Tags

* `latest`, `2`, `2.0`, `2.0release`:
  This is the latest build of [**2.0release**](https://github.com/ossrs/srs/tree/2.0release) branch.
* `develop`, `3`, `3.0`, `3.0release`:
  This is the latest build of [**3.0release**](https://github.com/ossrs/srs/tree/3.0release) branch.
* specified version:
  You can specify a version like `2.0.250`, `3.0.40` as tag.
* with ffmpeg:
  By default, all builds do not contain ffmpeg binary. You can add suffix `-ffmpeg` after any tag if you want to use ffmpeg. (ex: `3.0-ffmpeg`)

### Run

You have to export the container port ( or use 3rd-party tcp proxy ) of SRS. [For more information about port mapping](https://docs.docker.com/network/links/#connect-using-network-port-mapping).

A typical usage:
```Shell
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:3.0
```

And you can specify the launch command and params such as the configuration file. By default it will launch `objs/srs -c conf/docker.conf`.

Example:
```Shell
docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs:3.0 objs/srs -c my-custom.conf
```

### Configuration

There is a default configuration at `/srs/conf/docker.conf`.

You can use [**docker volume**](https://docs.docker.com/storage/volumes/) to override it.

Example:
```Shell
docker run -v /path/to/my-custom.conf:/srs/conf/docker.conf ossrs/srs:3.0
```

Or mount a folder & start with custom configration file name:
```Shell
docker run -v /path/to/my-conf.d:/srs ossrs/srs:3.0 objs/srs -c /srs/my-conf.d/custom.conf
```
