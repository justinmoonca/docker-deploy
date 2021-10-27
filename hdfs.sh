echo "=========启动 hdfs =============="
docker-compose up -d namenode
docker-compose up -d datanode1
docker-compose up -d datanode2
docker-compose up -d datanode3