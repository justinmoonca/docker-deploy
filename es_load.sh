#!/bin/sh

echo "=========导入ES Mapping=============="
docker cp es_create_index.sh es:/usr/share/elasticsearch
docker exec -it es /bin/bash -c "sh es_create_index.sh"
echo "======ES Mapping导入成功==========="