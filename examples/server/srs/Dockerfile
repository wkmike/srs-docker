FROM ossrs/srs:1.0.beta

ADD srs.conf /etc/srs.conf

CMD mkdir -p /data/log/ffmpeg && srs -c /etc/srs.conf

VOLUME ["/data"]
EXPOSE 1935

