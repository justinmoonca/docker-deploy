insert overwrite table dw.dwt_user_tags_map_all
select
user_id,
str_to_map(concat_ws(',',collect_set(concat(tag_id,':',tag_value)))) as user_tags
from
dw.dws_user_action_tags_map_all
group by user_id