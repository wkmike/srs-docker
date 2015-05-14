FROM ossrs/srs:1.0.beta

ADD distribute.conf /etc/distribute.conf

CMD mkdir -p /data/log/distribute && \
    srs -c /etc/distribute.conf

VOLUME ["/data"]
EXPOSE 1935

