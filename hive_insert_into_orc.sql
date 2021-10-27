insert overwrite table dwd.dim_user select * from tmp.dim_user_tmp;
insert overwrite table dwd.dim_order select * from tmp.dim_order_tmp ;
insert overwrite table dwd.dim_product select * from tmp.dim_product_tmp;
insert overwrite table dwd.dim_tags select * from tmp.dim_tags_tmp;
insert overwrite table dwd.dim_user_action select * from tmp.dim_user_action_tmp;
insert overwrite table dw.fact_goods_comments select * from tmp.fact_goods_comments_tmp;
insert overwrite table dw.fact_order_details select * from tmp.fact_order_details_tmp;
insert overwrite table dw.fact_user_actions select * from tmp.fact_user_actions_tmp;
insert overwrite table dw.dws_user_action_tags_map_all select * from tmp.dws_user_action_tags_map_all_tmp;