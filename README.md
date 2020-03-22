# srs-docker

![](http://ossrs.net:8000/gif/v1/sls.gif?site=github.com&path=/docker/rtc)
[![](https://cloud.githubusercontent.com/assets/2777660/22814959/c51cbe72-ef92-11e6-81cc-32b657b285d5.png)](https://github.com/ossrs/srs/wiki/v1_CN_Contact#wechat)

CentOS docker for [SRS](https://github.com/ossrs/srs) RTC developer.

## Usage

从[这里](https://www.docker.com/products/docker-desktop)下载Docker，并启动。

**>>> Clone SRS**

```
git clone https://gitee.com/winlinvip/srs.oschina.git srs &&
cd srs/trunk && git remote set-url origin https://github.com/ossrs/srs.git && git pull &&
git checkout feature/rtc
```

**>>> Start docker**

将本地目录`~/git/srs`映射到docker，可以在本地编辑。如果你的SRS在其他目录，也可以换成其他路径：

```
cd ~/git/srs && HostIP="192.168.1.3" &&
docker run -it -d -v `pwd`:/tmp/srs -w /tmp/srs/trunk -p 1935:1935 -p 1985:1985 -p 8080:8080 -p 8085:8085 -p 8000:8000/udp \
     --name=rtc --privileged --env CANDIDATE=$HostIP registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev bash
```

> Note: 如果是Mac，可以用命令获取IP地址: `ifconfig en0 inet| grep inet|awk '{print $2}'`

> Remark: 如果IP变更后，可以在Docker中更新IP就可以：`export CANDIDATE=192.168.1.3`

**>>> Build and start SRS in docker**

在Docker中编译SRS和启动：

```
docker exec rtc ./configure && make -j4 server && ./objs/srs -c conf/rtc.conf
```

如果不需要configure，可以直接编译和启动：

```
docker exec rtc make -j4 server && ./objs/srs -c conf/rtc.conf
```

> Note: 此时文件都在你的本地，比如配置文件，也可以使用其他的配置文件。

**>>> Publish stream to SRS**

推流到本地，或者使用OBS推流：

```
docker exec rtc ffmpeg -re -i doc/source.200kbps.768x320.flv -vcodec libx264 -profile:v baseline -acodec copy \
    -f flv -y rtmp://localhost/live/livestream
```

**>>> Play by WebRTC palyer**

使用H5播放：https://ossrs.net/players/rtc_player.html

输入下面的地址点开始播放：

```
webrtc://192.168.1.3/live/livestream
```
