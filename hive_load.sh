#!/bin/sh

echo "======建Hbase表结构========="
docker cp create_hbase_table.txt hbase-master:/
docker exec -it hbase-master /bin/bash -c "hbase shell create_hbase_table.txt"
echo "======建Hive表结构========="
docker cp hive_create_table.sql hive-server:/opt
docker exec -it hive-server /bin/bash -c "hive -f hive_create_table.sql"
echo "======导入Hive数仓数据==========="
docker cp dataSets namenode:/
docker exec -it namenode /bin/bash -c "hdfs dfs -put dataSets /"
docker cp hive_load_data_to_tmp.sql hive-server:/opt
docker cp hive_insert_into_orc.sql hive-server:/opt
docker cp hive_insert_table_dwt_user_tags_map_all.sql hive-server:/opt
docker cp hive_truncate_tmp.sql hive-server:/opt
docker exec -it hive-server /bin/bash -c "hive -f hive_load_data_to_tmp.sql"
docker exec -it hive-server /bin/bash -c "hive -f hive_insert_into_orc.sql"
docker exec -it hive-server /bin/bash -c "hive -f hive_insert_table_dwt_user_tags_map_all.sql"
docker exec -it hive-server /bin/bash -c "hive -f hive_truncate_tmp.sql"
docker exec -it hive-server /bin/bash -c "hive -e 'show databases'"
docker exec -it hive-server /bin/bash -c "hive -e 'select * from dw.dws_user_action_tags_map_all limit 10'"
docker exec -it hive-server /bin/bash -c "hive -e 'select * from dw.dwt_user_tags_map_all limit 10'"
echo "======Hive数仓导入成功==========="

