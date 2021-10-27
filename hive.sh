echo "=========启动 hive =============="
docker-compose up -d hive-metastore-postgresql
docker-compose up -d presto-coordinator
docker-compose up -d hive-metastore
docker-compose up -d hive-server