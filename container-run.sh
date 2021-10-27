sh hdfs.sh
sh yarn.sh
sh hive.sh
sh hbase.sh
sh spark.sh
echo "=========启动 nginx =============="
docker-compose up -d nginx
echo "=========启动 clickhouse =============="
docker-compose up -d clickhouse
echo "=========启动 es =============="
docker-compose up -d es