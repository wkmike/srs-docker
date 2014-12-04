FROM dockerfile/ubuntu

RUN apt-get update && \
    apt-get -y upgrade && \
    mkdir -p /data/install && \
    cd /data/install && \
    wget https://github.com/winlinvip/simple-rtmp-server/archive/1.0.beta.tar.gz && \
    tar xvpf 1.0.beta.tar.gz && \
    cd simple-rtmp-server-1.0.beta/trunk && \
    ./configure --with-ssl --with-hls --with-dvr --with-nginx --with-http-server --with-http-api --with-ffmpeg --with-transcode --with-ingest --with-stat --without-http-callback --without-librtmp --without-research --without-utest --without-gperf --without-gmc --without-gmp --without-gcp --without-gprof --without-arm-ubuntu12 --jobs=16 && \
    make --jobs=16 && \
    cp -rL objs/ffmpeg/ /usr/local/ && \
    cp -L objs/srs /usr/local/bin/ && \
    cd /data && \
    rm -rf /data/install && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data
