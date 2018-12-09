srs
===
A dockerized [SRS](https://github.com/ossrs/srs).

## Usage

**Install docker**

Download docker from [here](https://www.docker.com/products/docker-desktop) then start docker.

**Build docker image**

```
git clone https://github.com/ossrs/srs-docker.git && cd srs-docker && git checkout centos &&
docker build -f Dockerfile -t srs:dev .
```

**Clone SRS**

```
git clone https://github.com/ossrs/srs.git && cd srs
```

**Start docker**

```
docker run -it -v `pwd`:/tmp/srs -w /tmp/srs/trunk -p 1935:1935 -p 1985:1985 -p 8080:8080 srs:dev bash
```

**Build SRS in docker**

```
./configure && make
```

**Run SRS in docker**

```
./objs/srs -c conf/console.conf
```

