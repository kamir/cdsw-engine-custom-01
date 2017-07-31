# Dockerfile
FROM cloudera-cdsw-docker-repo.jfrog.io/cdsw/engine:1

MAINTAINER Mirko Kämpf "mirko@cloudera.com"

# update packages and install maven
RUN apt-get update && \
    apt-get install -y -q graphviz gnuplot vim wget curl maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install graphviz

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN apt-get update
RUN apt-get -y install cuda


