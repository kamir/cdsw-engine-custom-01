# Dockerfile
FROM cloudera-cdsw-docker-repo.jfrog.io/cdsw/engine:1

MAINTAINER Mirko Kämpf "mirko@cloudera.com"

# update packages and install maven
RUN apt-get update && \
    apt-get install -y -q gnuplot vim wget curl maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
