echo "=========启动 hbase =============="
docker-compose up -d zoo1
docker-compose up -d zoo2
docker-compose up -d zoo3
docker-compose up -d hbase-master
docker-compose up -d hbase-regionserver-1
docker-compose up -d hbase-regionserver-2
docker-compose up -d hbase-regionserver-3
docker-compose up -d phoenix