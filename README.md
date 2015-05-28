srs
===
A dockerized [Simple RTMP Server](https://github.com/winlinvip/simple-rtmp-server).
This is a much better solution than Wowza or Adobe Flash Media Server.
It allows for sophisticated custom live streaming setups.
Big thanks to [winlin](https://github.com/winlinvip), author of srs, for making this possible.

Usage
----

```
docker pull ossrs/srs:1.0.beta
```

Two main executables are available inside the container:

1. **srs**: The simple rtmp server binary, takes a configuration file, see examples.
2. **ffmpeg**: Used by srs, but also useful for directly streaming and transcoding video/audio of various format.

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
