FROM dockerfile/nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD key.pem /etc/nginx/key.pem
ADD cert.pem /etc/nginx/cert.pem

CMD \
    mkdir -p /data/log && \
    mkdir -p /data/cache && \
    mkdir -p /data/tmp && \
    nginx

VOLUME ["/data"]
EXPOSE 80
EXPOSE 443

