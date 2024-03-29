#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 arg1"
    exit 1
fi

if [ "$1" -lt 1 ]; then
    echo "Argument is less than 1. Exiting."
    exit 1
fi

no_of_nodes="$1"

for (( i=1; i<=no_of_nodes; i++ ))
do
    sudo docker run --name "node$i" --hostname "node$i" -v /home/username/Desktop/storage:/home/storage -itd i212498/mpiclone
    sudo docker exec "node$i" sudo service ssh restart
done

sudo docker exec node1 bash -c 'ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa -q\
    && cp /root/.ssh/id_rsa.pub /root/.ssh/node1 \
    && cp /root/.ssh/node1 /home/storage \
    && ip_address=$(hostname -I | cut -d" " -f1) \
    && echo "$ip_address" >> /home/storage/machinefile \
    && touch /root/.ssh/config \
    && echo "Host *
    StrictHostKeyChecking no" >> /root/.ssh/config \
    && chmod 400 /root/.ssh/config'

for (( i=2; i<=no_of_nodes; i++ ))
do
	# each will do same process as master + add its key as authorized_keys
	
	sudo docker exec "node$i" bash -c 'ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa -q\
    && cp /root/.ssh/id_rsa.pub /root/.ssh/node'"$i"' \
    && cp /root/.ssh/node'"$i"' /home/storage \
    && ip_address=$(hostname -I | cut -d" " -f1) \
    && echo "$ip_address" >> /home/storage/machinefile \
    && cp /home/storage/node1 /root/.ssh \
    && cat /root/.ssh/node1 >> /root/.ssh/authorized_keys \
    && touch /root/.ssh/config \
    && echo "Host *
    StrictHostKeyChecking no" >> /root/.ssh/config \
    && chmod 400 /root/.ssh/config'

	sudo docker exec node1 bash -c 'cp /home/storage/node'"$i"' /root/.ssh \
    && cat /root/.ssh/node'"$i"' >> /root/.ssh/authorized_keys'

       
done

sudo docker exec -it node1 bash
