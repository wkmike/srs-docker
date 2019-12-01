# https://docs.docker.com/engine/reference/builder/#arg
ARG tag=v3.0-a2
ARG url=https://github.com/ossrs/srs.git

FROM centos:7 AS build
ARG tag
ARG url
RUN yum install -y gcc make gcc-c++ patch unzip perl git
RUN cd /tmp && git clone --depth=1 --branch ${tag} ${url} srs
RUN cd /tmp/srs/trunk && ./configure && make && make install
COPY conf /usr/local/srs/conf

FROM centos:7 AS dist
EXPOSE 1935 1985 8080
COPY --from=build /usr/local/srs /usr/local/srs
WORKDIR /usr/local/srs
CMD ["./objs/srs", "-c", "conf/srs.conf"]
