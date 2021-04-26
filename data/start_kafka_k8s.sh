#!/bin/bash 

source /etc/profile

if [[ -z "$KAFKA_PORT" ]]; then
    export KAFKA_PORT=9092
fi

echo "start kafka now, make sure service zookeeper is up" 
cd /usr/local/kafka
bin/kafka-server-start.sh config/server.properties --override broker.id=${HOSTNAME##*-} \
	--override listeners=PLAINTEXT://:$KAFKA_PORT --override zookeeper.connect=$ZK_SERVER \
	--override advertised.listeners=PLAINTEXT://$ADVERTISED_IP:$KAFKA_PORT

