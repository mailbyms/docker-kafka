#!/bin/bash 

StartAPP()
{
    source /etc/profile

    echo "start kafka now, make sure service zookeeper is up" 
    cd /usr/local/kafka
    bin/kafka-server-start.sh config/server.properties --override broker.id=${HOSTNAME##*-} \
	--override listeners=PLAINTEXT://:9092 --override zookeeper.connect=$ZK_SERVER \
    --override advertised.listeners=PLAINTEXT://$ADVERTISED_IP:9092 

}

StartAPP 

