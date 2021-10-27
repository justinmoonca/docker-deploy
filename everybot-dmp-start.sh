#!/bin/sh

echo "=========环境搭建开始=============="
echo -e "\n"
echo "=========建立网络 moon_dmp_network =============="
docker network create --driver bridge --subnet 172.23.0.0/24 --gateway 172.23.0.1 moon_dmp_network
echo "=========执行 Dockerfile-hbase =============="
docker build -f Dockerfile-hbase -t bde2020/hbase-regionserver-moon-dmp:1.0.0-hbase1.2.6 .
echo "=========执行 Dockerfile-nginx =============="
docker build -f Dockerfile-nginx -t nginx-moon-dmp:1.20.0 .
echo "=========执行 Dockerfile-spark-master =============="
docker build -f Dockerfile-spark-master -t moon-spark-master:2.3.0-hadoop2.7 .
echo "=========执行 Dockerfile-spark-worker =============="
docker build -f Dockerfile-spark-worker -t moon-spark-worker:2.3.0-hadoop2.7 .
echo "=========建立文件夹=============="
mkdir -p ./data/hadoop/namenode
mkdir -p ./data/hadoop/datanode1
mkdir -p ./data/hadoop/datanode2
mkdir -p ./data/hadoop/datanode3
mkdir -p ./data/postgresql/data
mkdir -p ./data/zookeeper/zoo1/data
mkdir -p ./data/zookeeper/zoo2/data
mkdir -p ./data/zookeeper/zoo3/data
mkdir -p ./data/es/data
mkdir -p ./data/clickhouse
mkdir -p ./data/redis/data
mkdir -p ./data/mysql/data
mkdir -p ./data/rabbitmq/data
echo -e "\n"
echo "=========搭建完成，执行以下脚本启动组件=============="
echo "=========hdfs组: sh hdfs.sh=============="
echo "=========yarn组: sh yarn.sh=============="
echo "=========hive组: sh hive.sh=============="
echo "=========hbase组: sh hbase.sh=============="
echo "=========spark组: sh spark.sh=============="
echo "=========nginx组: sh nginx.sh=============="
echo "=========es组: sh es.sh=============="
echo "=========clickhouse组: sh clickhouse.sh=============="
echo "=========mysql组: sh mysql.sh=============="
echo "=========redis组: sh redis.sh=============="
echo "=========kibana组: sh kibana.sh=============="
echo "=========rabbitmq组: sh rabbitmq.sh=============="



