# Dockerfile
FROM docker.repository.cloudera.com/cdsw/engine:2

MAINTAINER Mirko Kämpf "mirko@cloudera.com"

# update packages and install maven
RUN apt-get update && \
    apt-get install -y -q graphviz maven mc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install graphviz



