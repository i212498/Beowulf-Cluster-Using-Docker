#!/bin/bash

# Check if the number of arguments is exactly 1
if [ $# -ne 1 ]; then
    echo "Usage: $0 <number_of_containers>"
    exit 1
fi

no_of_containers=$1

container_names=""

sudo docker exec node1 bash -c 'rm /home/storage/machinefile'

for (( i=1; i<=$no_of_containers; i++ )); do
    container_names+="node$i "
    sudo docker exec "node$i" bash -c 'rm /home/storage/node'"$i"''
done




sudo docker stop $container_names && sudo docker rm $container_names
