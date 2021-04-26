*前往 github 查看 `dockerfile` 及 `docker-compose.yml`*  
*本 repo 内容与 https://github.com/mailbyms/DockerBuild/tree/master/KAFKA 一致*

# 注意
1. 修改.env 里的COMPOSE_PROJECT_NAME，它会影响：
	生成的容器名字的前缀  
	生成的网络名字的前缀  
2. kafka 的 hostname 格式为 xxx-id，在kafka启动脚本中，id会作为 broker-id
3. kafka 从环境变量 ZK_SERVER 获取 zookeeper 的连接地址
4. 如果 kafka 要给其它电脑访问，则设置 docker-compose.yml 的 ADVERTISED_IP 为宿主机的 IP
5. KAFKA_PORT 同时作为 listeners 和 advertised.listeners 的端口。即要求容器映射端口时，内外端口值一致。默认值为9092

# 启动相关
- Kafka 在 Zookeeper 上注册，Zookeeper 连接超时默认为 18 秒。当 Kafka 停止后马上启动，会报错 NodeID 已存在。须等待 Zookeper 打印 18 秒超时后再启动 Kafka
- Kafka 的 Cluster ID （本地保存在 /tmp/kafka-logs/meta.properties），同样在 Zookeeper 上注册。所以 Zookeeper 要做好数据持久化

