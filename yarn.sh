echo "=========启动 yarn =============="
docker-compose up -d resourcemanager
docker-compose up -d nodemanager1
docker-compose up -d nodemanager2
docker-compose up -d nodemanager3
docker-compose up -d historyserver