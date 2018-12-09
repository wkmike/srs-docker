FROM centos

RUN yum install -y gcc gcc-c++ make patch sudo
RUN yum install -y unzip perl
RUN yum install -y automake libtool zlib-devel

# nasm 2.13+ for FFMPEG4.1
ADD nasm-2.14.tar.bz2 /tmp
RUN cd /tmp/nasm-2.14 && ./configure && make && make install

