CREATE database IF NOT EXISTS dwd;
CREATE database IF NOT EXISTS dw;
CREATE database IF NOT EXISTS tmp;

CREATE TABLE IF NOT EXISTS `dwd.dim_product` (
  `item_sk` int comment '代理健',
  `item_id` string comment '商品id',
  `cate` int comment '商品分类',
  `brand` int comment '商品品牌',
  `a1` int comment '商品属性1',
  `a2` int comment '商品属性2',
  `a3` int comment '商品属性3'
)COMMENT '商品维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dim_product_tmp` (
  `item_sk` int comment '代理健',
  `item_id` string comment '商品id',
  `cate` int comment '商品分类',
  `brand` int comment '商品品牌',
  `a1` int comment '商品属性1',
  `a2` int comment '商品属性2',
  `a3` int comment '商品属性3'
)COMMENT '商品维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;


CREATE TABLE IF NOT EXISTS `dwd.dim_user` (
  `user_sk` int comment '代理键',
  `user_id` string comment '用户id',
  `user_lv_cd` int comment '用户等级',
  `gender` int comment '用户性别 0男 1女',
  `age` int comment '用户年龄' 
)COMMENT '用户维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC 
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dim_user_tmp` (
  `user_sk` int comment '代理键',
  `user_id` string comment '用户id',
  `user_lv_cd` int comment '用户等级',
  `gender` int comment '用户性别 0男 1女',
  `age` int comment '用户年龄' 
)COMMENT '用户维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;

CREATE TABLE IF NOT EXISTS `dwd.dim_order` (
  `order_sk` int comment '代理键',
  `order_id` string comment '订单id',
  `user_id` string comment '用户id' ,
  `final_total_amount` decimal(16,2) comment '总金额',
  `finish_time` string comment '完成时间',
  `finish_time_hour` string comment '完成时间（小时）'
)COMMENT '订单维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dim_order_tmp` (
  `order_sk` int comment '代理键',
  `order_id` string comment '订单id',
  `user_id` string comment '用户id' ,
  `final_total_amount` decimal(16,2) comment '总金额',
  `finish_time` string comment '完成时间',
  `finish_time_hour` string comment '完成时间（小时）'
)COMMENT '订单维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;

CREATE TABLE IF NOT EXISTS `dwd.dim_tags` (
  `tag_rule` int comment '标签规则',
  `tag_id` int comment '标签id (int类型)',
  `tag_level` int comment '标签一级层级',
  `tag_name` string comment '标签值',
  `tag_level_second` int comment '标签二级层级',
  `tag_id_string` string comment '标签id (string类型)',
  `tag_name_cn` string comment '标签中文名称'

)COMMENT '标签表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dim_tags_tmp` (
  `tag_rule` int comment '标签规则',
  `tag_id` int comment '标签id (int类型)',
  `tag_level` int comment '标签一级层级',
  `tag_name` string comment '标签名称',
  `tag_level_second` int comment '标签二级层级',
  `tag_id_string` string comment '标签id (string类型)',
  `tag_name_cn` string comment '标签中文名称'
)COMMENT '标签表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;

CREATE TABLE IF NOT EXISTS `dwd.dim_user_action` (
  `action_id` int comment '用户行为id',
  `action_name` string comment '用户行为名称',
  `action_weight` int comment '用户行为权重',
  `action_tag_id` int comment '用户行为对应标签id'
)COMMENT '用户行为维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dim_user_action_tmp` (
  `action_id` int comment '用户行为id',
  `action_name` string comment '用户行为名称',
  `action_weight` int comment '用户行为权重',
  `action_tag_id` int comment '用户行为对应标签id'
)COMMENT '用户行为维度表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;


CREATE TABLE IF NOT EXISTS `dw.fact_order_details` (
  `user_id` string comment '用户id',
  `order_id` string comment '订单id',
  `category_id` string comment '品类id',
  `price` string comment '总金额',
  `finish_time` string comment '完成时间',
  `finish_time_hour` string comment '完成时间（小时）'
)COMMENT '订单明细事实表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.fact_order_details_tmp` (
  `user_id` string comment '用户id',
  `order_id` string comment '订单id',
  `category_id` string comment '品类id',
  `price` string comment '总金额',
  `finish_time` string comment '完成时间',
  `finish_time_hour` string comment '完成时间（小时）'
)COMMENT '订单明细事实表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;

CREATE TABLE IF NOT EXISTS `dw.fact_goods_comments` (
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `content` string comment '商品评论',
  `label` int comment '评论情感标签 （0：负评 1：正评）'
)COMMENT '商品评论事实表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.fact_goods_comments_tmp` (
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `content` string comment '商品评论',
  `label` int comment '评论情感标签 （0：负评 1：正评）'
)COMMENT '商品评论事实表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
;


CREATE TABLE IF NOT EXISTS `dw.fact_user_actions` (
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `time` string comment '发生时间',
  `type` int comment '用户行为类型',
  `cate` int comment '用户行为作用于的商品类别',
  `brand` int comment '用户行为作用于的商品品牌'
)COMMENT '用户行为日志表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.fact_user_actions_tmp` (
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `time` string comment '发生时间',
  `type` int comment '用户行为类型',
  `cate` int comment '用户行为作用于的商品类别',
  `brand` int comment '用户行为作用于的商品品牌'
)COMMENT '用户行为日志表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;


CREATE TABLE IF NOT EXISTS `dw.dws_user_action_tags_map_all`(
  `user_id` string comment '用户id',
  `tag_id` string comment '标签id',
  `tag_value` string comment '标签value值'
)COMMENT '用户行为标签聚合表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dws_user_action_tags_map_all_tmp`(
  `user_id` string comment '用户id',
  `tag_id` string comment '标签id',
  `tag_value` string comment '标签value值'
)COMMENT '用户行为标签聚合表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;

CREATE TABLE IF NOT EXISTS `dw.dws_user_action_tags_map_count_all`(
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `tags` map<int,int> comment '用户标签聚合统计',
  `year` int comment '年',
  `month` int comment '月',
  `day` int comment '日'
)COMMENT '用户标签聚合统计表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ';'
map keys terminated by ':'
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dws_user_action_tags_map_count_all_tmp`(
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `tags` map<int,int> comment '用户标签聚合统计',
  `year` int comment '年',
  `month` int comment '月',
  `day` int comment '日'
)COMMENT '用户标签聚合统计表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ';'
map keys terminated by ':'
;

CREATE TABLE IF NOT EXISTS `dw.dws_user_consume_tags_all`(
  `user_id` string comment '用户id',
  `tags` map<string,string> comment '用户消费标签聚合 map<标签id:标签value值>' 
)COMMENT '用户消费标签聚合表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
map keys terminated by ':'
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dws_user_consume_tags_all_tmp`(
  `user_id` string comment '用户id',
  `tags` map<string,string> comment '用户消费标签聚合 map<标签id:标签value值>' 
)COMMENT '用户消费标签聚合表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
map keys terminated by ':'
;


CREATE TABLE IF NOT EXISTS `dw.dws_rfm`(
  `user_id` string comment '用户id',
  `r` int comment '最近一次消费',
  `f` int comment '消费频率',
  `m` decimal(16,2) comment '消费金额' 
)COMMENT 'RFM表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;


CREATE TABLE IF NOT EXISTS `dw.dwt_user_action_tags_weight`(
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `tag_id` string comment '标签id',
  `tag_weight` int comment '标签权重',
  `year` int comment '年',
  `month` int comment '月' ,
  `day` int comment '日' 
)COMMENT '用户行为标签权重主题表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES("orc.compress"="ZLIB")
;

CREATE TABLE IF NOT EXISTS `tmp.dwt_user_action_tags_weight_tmp`(
  `user_id` string comment '用户id',
  `item_id` string comment '商品id',
  `tag_id` string comment '标签id',
  `tag_weight` int comment '标签权重',
  `year` int comment '年',
  `month` int comment '月' ,
  `day` int comment '日' 
)COMMENT '用户行为标签权重主题表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
;



CREATE EXTERNAL TABLE IF NOT EXISTS `dw.dwt_user_tags_map_all`(
  `user_id` string comment '用户id',
  `user_tags` map<string,string> comment '用户标签聚合' 
)COMMENT '用户标签主题表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
map keys terminated by ':'
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,tags:#s:b")
TBLPROPERTIES("hbase.table.name" = "user_tags_map_all")
;
