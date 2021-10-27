echo "=========停止组件============="
docker-compose down
echo "=========删除数据============="
rm -rf ./data
echo "=========删除网络============="
docker network remove moon_dmp_network