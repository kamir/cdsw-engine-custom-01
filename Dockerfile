# Dockerfile
FROM docker.repository.cloudera.com/cdsw/engine:5

MAINTAINER Mirko Kämpf "mirko@cloudera.com"

# update packages and install maven
RUN apt-get update && \
    apt-get install -y -q graphviz maven mc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install graphviz
RUN pip install beautifulsoup4 && pip3 install beautifulsoup4

RUN mkdir -p /data

RUN wget https://leidata.gleif.org/api/v1/concatenated-files/lei2/20180918/zip -o data/concatenated_files_lei2_20180918.zip
RUN wget https://leidata.gleif.org/api/v1/concatenated-files/rr/20180918/zip -o data/concatenated_files_rr_20180918.zip
RUN wget https://leidata.gleif.org/api/v1/concatenated-files/repex/20180918/zip -o data/concatenated-files_repex_20180918.zip

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN apt-get update
RUN apt-get -y install cuda

RUN mkdir -p /opt/tools
WORKDIR /opt/tools

RUN git clone https://github.com/opencypher/cypher-for-apache-spark

WORKDIR /opt/tools/cypher-for-apache-spark

RUN mvn clean compile install






