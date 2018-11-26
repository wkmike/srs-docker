srs
===
A dockerized [Simple RTMP Server](https://github.com/winlinvip/simple-rtmp-server).
This is a much better solution than Wowza or Adobe Flash Media Server.
It allows for sophisticated custom live streaming setups.
Big thanks to [winlin](https://github.com/winlinvip), author of srs, for making this possible.

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

There is a default configuration that in the `/srs/conf/docker.conf`.

You can use [**docker volume**](https://docs.docker.com/storage/volumes/) to override it.

Example:
```Shell
docker run -v ./my-custom.conf:/srs/conf/docker.conf ossrs/srs:3.0
```

Or mount a folder & start with custom configration file name:
```Shell
docker run -v ./my-conf.d:/srs ossrs/srs:3.0 objs/srs -c /srs/my-conf.d/custom.conf
```

Examples
---
These examples use [fig](http://www.fig.sh).

### server
This is a simple server that runs one instance of srs for both transcoding, dvr and outputing hls.
It runs an instance of nginx to distribute hls.

### ingest
This is a ingest configuration for streaming a flv file to the srs server for testing.

### hsfztv
This setup is used on [www.hsfz.tv](https://www.hsfz.tv/) for live streaming of a school event.
The setup for this example is a bit more involved due to the need to support both audience in China and out around the world.

* **origin**:
  This server runs near the streaming source, it transcodes input stream to 720p h264 + aac.
  It will then distribute this transcoded stream via rtmp to multiple edge servers.

* **edge**:
  We run two of these servers.
  The edge server transcodes the 720p stream into 463p, 360p and 216p.
  It then generates hls files for all four qualities.
  However, keep in mind that these streams in adaptive hls are not quite synchronized.

* **cdn**:
  We use cloudfront for distributing the hls stream, which is basically a bunch of static files.
  But we also spawn multiple cdn machines of our own using this configuration to provide for viewers inside China where cloudfront is unstable.
  Using this setup, we can scale up our max bandwidth without stressing the srs server.

![hsfztv](https://cdn.hsfztv.net/media/dance-2014-screenshot.png)
