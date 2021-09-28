# 2.活动期间参与过A玩法的玩家，竞速模式参与时长占比分布
/*
竞速模式参与时长占比=活动期间A玩法竞速模式总参与时长/活动期间A玩法总参与时长
*/
select
case when compete_hours/total_hours= 0 then '0'
when compete_hours/total_hours>0 and compete_hours/total_hours<0.2 then '(0,0.2)'
when compete_hours/total_hours>=0.2 and compete_hours/total_hours<0.4 then '[0.2,0.4)'
when compete_hours/total_hours>=0.4 and compete_hours/total_hours<0.6 then '[0.4,0.6)'
when compete_hours/total_hours>=0.6 and compete_hours/total_hours<0.8 then '[0.6,0.8)'
when compete_hours/total_hours>=0.8 and compete_hours/total_hours<1 then '[0.8,1)'
else '1' end as race_rate, count(account_id) as player_number
from
(
select sum(case when WEEKDAY(record_date)+1=6 or WEEKDAY(record_date)+1=7 then day_hours else 0 end) as compete_hours, sum(day_hours) as total_hours, account_id
from
(
select TIMESTAMPDIFF(SECOND,t1.record_date,t2.record_date)/(60*60) as day_hours, t1.record_date, t1.account_id
from
(
select record_date, account_id, game_type,`status`, rank() over(partition by account_id order by record_date ) as ranks
from
player_play_log
) t1,
(
select record_date, account_id, game_type,`status`, rank() over(partition by account_id order by record_date ) as ranks
from
player_play_log
) t2
where t1.account_id=t2.account_id and t1.game_type='A'
and t1.ranks+1=t2.ranks and t1.status=1
) tt
group by account_id
) tt1
group by
case when compete_hours/total_hours= 0 then '0'
when compete_hours/total_hours>0 and compete_hours/total_hours<0.2 then '(0,0.2)'
when compete_hours/total_hours>=0.2 and compete_hours/total_hours<0.4 then '[0.2,0.4)'
when compete_hours/total_hours>=0.4 and compete_hours/total_hours<0.6 then '[0.4,0.6)'
when compete_hours/total_hours>=0.6 and compete_hours/total_hours<0.8 then '[0.6,0.8)'
when compete_hours/total_hours>=0.8 and compete_hours/total_hours<1 then '[0.8,1)'
else '1' end;