FROM dockerfile/nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD livestream.m3u8 /etc/nginx/livestream.m3u8
ADD crossdomain.xml /etc/nginx/crossdomain.xml

CMD \
    mkdir -p /data/log/nginx && \
    mkdir -p /data/root && \
    cp /etc/nginx/livestream.m3u8 /data/root && \
    cp /etc/nginx/crossdomain.xml /data/root && \
    nginx

VOLUME ["/data"]
EXPOSE 80

