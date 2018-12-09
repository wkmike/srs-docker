FROM centos

RUN yum install -y gcc gcc-c++ make patch sudo
RUN yum install -y unzip perl

