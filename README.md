srs
===

CentOS docker for [SRS](https://github.com/ossrs/srs) developer.

## Usage

**Install docker**

Download docker from [here](https://www.docker.com/products/docker-desktop) then start docker.

**Build docker image**

```
docker pull ossrs/dev
```

**Clone SRS**

```
git clone https://github.com/ossrs/srs.git && cd srs
```

**Start docker**

```
docker run -it -v `pwd`:/tmp/srs -w /tmp/srs/trunk -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/dev bash
```

**Build SRS in docker**

```
./configure && make
```

**Run SRS in docker**

```
./objs/srs -c conf/console.conf
```

## Features

- [x] OpenSSL 1.1.0e
- [x] FFMPEG 4.1 with x264 core.157
- [x] GIT
