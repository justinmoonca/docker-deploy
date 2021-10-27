echo "=========启动 spark =============="
docker-compose up -d spark-master
docker-compose up -d spark-worker-1
docker-compose up -d spark-worker-2
docker-compose up -d spark-worker-3