#!/bin/sh

echo "========创建 clickhouse 表结构=============="
docker cp ch_create_table.sql clickhouse:/
docker exec -it clickhouse /bin/bash -c "clickhouse-client --multiquery < ch_create_table.sql"
docker exec -it clickhouse /bin/bash -c "clickhouse-client --query='show tables'"
echo "========创建clickhouse表结构成功=============="
