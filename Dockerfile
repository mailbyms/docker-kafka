# docker build -f Dockerfile.kafka.k8s -t kafka:k8s4 .

# base image
FROM openjdk:8u275-jre

#MAINTAINER
MAINTAINER MIKE

ADD https://archive.apache.org/dist/kafka/2.5.0/kafka_2.12-2.5.0.tgz /usr/local/
ADD data/start_kafka_k8s.sh /usr/bin/start_kafka.sh

RUN chmod +x /usr/bin/start_kafka.sh && ln -s /usr/local/kafka_2.12-2.5.0 /usr/local/kafka

CMD ["start_kafka.sh"]

