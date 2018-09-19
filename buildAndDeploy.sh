export L=cdsw-caps-cuda

docker build -t kamir/$L . 

export T=$(date +%I_%M_%S)
echo "current time is: ".$T

docker image ls

docker run -it -d --name container_$T kamir/$L

docker container ls

read -p "Container-ID to connect to : " C_ID

echo $C_ID 

docker exec -i -t $C_ID /bin/bash

docker container stop $C_ID



