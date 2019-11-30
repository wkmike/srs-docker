
FROM centos:7 AS build
RUN yum install -y gcc make gcc-c++ patch unzip perl
ADD srs.tar.bz2 /tmp/
RUN cd /tmp/srs/trunk && ./configure && make && make install
COPY conf /usr/local/srs/conf

FROM centos:7 AS dist
EXPOSE 1935 1985 8080
COPY --from=build /usr/local/srs /usr/local/srs
WORKDIR /usr/local/srs
CMD ["./objs/srs", "-c", "conf/srs.conf"]
