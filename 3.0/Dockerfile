# https://docs.docker.com/engine/reference/builder/#arg
ARG tag=v3.0-a2

FROM centos:7 AS build
ARG tag
RUN yum install -y gcc make gcc-c++ patch unzip perl git
RUN cd /tmp && git clone --depth=1 --branch ${tag} https://gitee.com/winlinvip/srs.oschina.git srs
RUN cd /tmp/srs/trunk && ./configure && make && make install
COPY conf /usr/local/srs/conf

FROM centos:7 AS dist
ARG tag
EXPOSE 1935 1985 8080
COPY --from=build /usr/local/srs /usr/local/srs
WORKDIR /usr/local/srs
CMD ["./objs/srs", "-c", "conf/srs.conf"]
