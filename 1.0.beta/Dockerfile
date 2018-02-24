FROM debian:wheezy

RUN \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends libpcre3 zlib1g && \
    apt-get install -y --force-yes --no-install-recommends automake autoconf libtool build-essential wget ca-certificates unzip libpcre3-dev zlib1g-dev && \
    mkdir -p /data/install && \
    cd /data/install && \
    wget https://github.com/ossrs/srs/archive/v1.0-r4.tar.gz && \
    tar xvpf 1.0.beta.tar.gz && \
    cd simple-rtmp-server-1.0.beta/trunk && \
    ./configure && make -j16 && \
    cp -rL objs/ffmpeg/ /usr/local/ && \
    cp -L objs/srs /usr/local/bin/ && \
    cd /data && \
    rm -rf /data/install && \
    apt-get remove -y --force-yes --purge --auto-remove automake autoconf libtool build-essential wget ca-certificates unzip libpcre3-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data
