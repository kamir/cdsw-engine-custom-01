# Dockerfile
FROM docker.repository.cloudera.com/cdsw/engine:2

MAINTAINER Mirko Kämpf "mirko@cloudera.com"

# update packages and install maven
RUN apt-get update && \
    apt-get install -y -q graphviz gnuplot maven mc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install graphviz

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN apt-get update
RUN apt-get -y install cuda


