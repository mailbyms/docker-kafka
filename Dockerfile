# docker build -f Dockerfile.kafka.k8s -t kafka:k8s4 .

### phase 1
FROM openjdk:8u275-jre

ADD https://archive.apache.org/dist/kafka/2.5.0/kafka_2.12-2.5.0.tgz /target/
RUN cd /target/ \
    && tar xvf kafka_2.12-2.5.0.tgz \
    && rm -f *.tgz

### phase 2
FROM openjdk:8u275-jre

COPY --from=0  /target /usr/local/
ADD data/start_kafka_k8s.sh /usr/bin/start_kafka.sh

RUN chmod +x /usr/bin/start_kafka.sh && ln -s /usr/local/kafka_2.12-2.5.0 /usr/local/kafka

CMD ["start_kafka.sh"]

