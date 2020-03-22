# SRS

![](http://ossrs.net:8000/gif/v1/sls.gif?site=github.com&path=/docker/encoder)
[![](https://cloud.githubusercontent.com/assets/2777660/22814959/c51cbe72-ef92-11e6-81cc-32b657b285d5.png)](https://github.com/ossrs/srs/wiki/v1_CN_Contact#wechat)

This is a encoder docker, to publish a RTMP stream to `rtmp://localhost/live/livestream`.

<a name="srs3"></a>
<a name="usage"></a>
## Usage

For [SRS3](https://github.com/ossrs/srs/tree/3.0release) and [tags](https://github.com/ossrs/srs/tags).

Run encoder in docker by:

```bash
docker run ossrs/srs:encoder
```

## Aliyun

To use docker images in [AliyunCR](https://cr.console.aliyun.com/), 
please use `registry.cn-hangzhou.aliyuncs.com/ossrs/srs`.

For example:

```bash
docker run registry.cn-hangzhou.aliyuncs.com/ossrs/srs:encoder
```

> Note: Strongly recommend to use AliyunCR, because it's is much faster and has all [tags](https://hub.docker.com/repository/docker/ossrs/srs/tags?page=1).

Winlin 2019.11
