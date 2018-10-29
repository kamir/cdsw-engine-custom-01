export IMG_TAG=cdsw-base-with-maven-graphviz-gnuplot-cuda-8.0

docker build -t kamir/$IMG_TAG . 

export T=$(date +%I_%M_%S)
echo "current time is: ".$T

docker image ls

docker run -it -d --name container_$T kamir/$IMG_TAG

docker container ls

############################
#
# Testdrive ...
#
############################
# read -p "Container-ID to connect to : " C_ID
# echo $C_ID 
# docker exec -i -t $C_ID /bin/bash
# docker container stop $C_ID



docker tag kamir/$IMG_TAG ciw-dev-gw.vpc.cloudera.com:5000/$IMG_TAG:latest

docker push ciw-dev-gw.vpc.cloudera.com:5000/$IMG_TAG:latest