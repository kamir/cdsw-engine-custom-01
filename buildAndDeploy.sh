docker build -t kamir/cdsw-base-with-maven-graphviz-gnuplot . 

export T=$(date +%I_%M_%S)
echo $T

#docker create \
#    --name custom_cdsw_$T \
#    kamir/cdsw-custom-2

docker run \
    --name custom_cdsw_$T \
    kamir/cdsw-custom-2

