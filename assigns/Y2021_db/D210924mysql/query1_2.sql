
# 1. 每周获得闯关次数最多的玩家top10
select week_number, role_id, win_number
from
(
select week(mg.record_date) as week_number,mg.role_id,sum(case when result=1 then 1 else 0 end) as win_number,
rank() over(partition by week(mg.record_date) order by sum(case when result=1 then 1 else 0 end) desc) as ranks
from 
(
select SUBSTRING_INDEX(member,',',1) as account_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',2),',',-1) as role_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',3),',',-1) as name, game_id,record_date
from 
(
select  SUBSTRING_INDEX(SUBSTRING_INDEX(group_member_info,';',help_topic_id+1),';',-1) as member,group_info.game_id, group_info.record_date
from group_info,mysql.help_topic
where help_topic_id<LENGTH(group_member_info)-LENGTH(REPLACE(group_member_info,';',''))+1
) t
) mg join group_result gr on mg.record_date=gr.record_date
and mg.game_id=gr.game_id
group by week_number,mg.role_id
) res
where ranks<=10;

/*
思路：

select SUBSTRING_INDEX(member,',',1) as account_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',2),',',-1) as role_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',3),',',-1) as name, game_id,record_date
from 
(
select  SUBSTRING_INDEX(SUBSTRING_INDEX(group_member_info,';',help_topic_id+1),';',-1) as member,group_info.game_id, group_info.record_date
from group_info,mysql.help_topic
where help_topic_id<LENGTH(group_member_info)-LENGTH(REPLACE(group_member_info,';',''))+1
) t
这个中间过程把账号的id，role，名称 以及所在的game 和game 发生的时间对应出来
用上面这个结果和group_result 连接，条件是on mg.record_date=gr.record_date and mg.game_id=gr.game_id

select week(mg.record_date) as week_number,mg.role_id,sum(case when result=1 then 1 else 0 end) as win_number,
rank() over(partition by week(mg.record_date) order by sum(case when result=1 then 1 else 0 end) desc) as ranks
from 
(
select SUBSTRING_INDEX(member,',',1) as account_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',2),',',-1) as role_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',3),',',-1) as name, game_id,record_date
from 
(
select  SUBSTRING_INDEX(SUBSTRING_INDEX(group_member_info,';',help_topic_id+1),';',-1) as member,group_info.game_id, group_info.record_date
from group_info,mysql.help_topic
where help_topic_id<LENGTH(group_member_info)-LENGTH(REPLACE(group_member_info,';',''))+1
) t
) mg join group_result gr on mg.record_date=gr.record_date
and mg.game_id=gr.game_id
group by week_number,mg.role_id

这个中间结果得到一年中的第几周week——number，角色id，闯关次数，排名

最后，选出每周中排名在10以内的角色及闯关次数
*/


# 2. 每周积分获得最多最多的玩家top10
select week_number, role_id, points
from
(
select week(mg.record_date) as week_number,mg.role_id,sum(case when result=1 then 100 else -50 end) as points,
rank() over(partition by week(mg.record_date) order by sum(case when result=1 then 100 else -50 end) desc) as ranks
from 
(
select SUBSTRING_INDEX(member,',',1) as account_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',2),',',-1) as role_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',3),',',-1) as name, game_id,record_date
from 
(
select  SUBSTRING_INDEX(SUBSTRING_INDEX(group_member_info,';',help_topic_id+1),';',-1) as member,group_info.game_id, group_info.record_date
from group_info,mysql.help_topic
where help_topic_id<LENGTH(group_member_info)-LENGTH(REPLACE(group_member_info,';',''))+1
) t
) mg join group_result gr on mg.record_date=gr.record_date
and mg.game_id=gr.game_id
group by week_number,mg.role_id
) res
where ranks<=10;


/*
思路：

select SUBSTRING_INDEX(member,',',1) as account_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',2),',',-1) as role_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',3),',',-1) as name, game_id,record_date
from 
(
select  SUBSTRING_INDEX(SUBSTRING_INDEX(group_member_info,';',help_topic_id+1),';',-1) as member,group_info.game_id, group_info.record_date
from group_info,mysql.help_topic
where help_topic_id<LENGTH(group_member_info)-LENGTH(REPLACE(group_member_info,';',''))+1
) t
这个中间过程把账号的id，role，名称 以及所在的game 和game 发生的时间对应出来
用上面这个结果和group_result 连接，条件是on mg.record_date=gr.record_date and mg.game_id=gr.game_id

select week(mg.record_date) as week_number,mg.role_id,sum(case when result=1 then 100 else -50 end) as points,
rank() over(partition by week(mg.record_date) order by sum(case when result=1 then 100 else -50 end) desc) as ranks
from 
(
select SUBSTRING_INDEX(member,',',1) as account_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',2),',',-1) as role_id, SUBSTRING_INDEX(SUBSTRING_INDEX(member,',',3),',',-1) as name, game_id,record_date
from 
(
select  SUBSTRING_INDEX(SUBSTRING_INDEX(group_member_info,';',help_topic_id+1),';',-1) as member,group_info.game_id, group_info.record_date
from group_info,mysql.help_topic
where help_topic_id<LENGTH(group_member_info)-LENGTH(REPLACE(group_member_info,';',''))+1
) t
) mg join group_result gr on mg.record_date=gr.record_date
and mg.game_id=gr.game_id
group by week_number,mg.role_id

这个中间结果得到一年中的第几周week——number，角色id，获得的积分（按照闯关一次100，失败一次-50计算），排名

最后，选出每周中排名在10以内的角色及获得的积分数
*/
