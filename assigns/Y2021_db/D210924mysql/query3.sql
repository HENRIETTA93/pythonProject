drop function if exists fn_firstday_week;
delimiter ||
create function fn_firstday_week(years int, weeks int) returns varchar(20)
begin
	declare days int default 0;
	if weeks=0 then
		return concat(years,'-01-01');
	elseif weeks>=1 then
	  select weekday(concat(years,'-01-01'))+1 into days;
		return makedate(years, weeks*7-days+2);
	else
		return null;
	end if;
end||
delimiter ;


# 1.每周不同模式的参与率
/*
普通玩法vs竞速模式参与率 当周玩法参与率= 当周玩法开启期间进入玩法的玩家数/当周玩法开启期间的活跃登录玩家数
第几周，玩法模式，该模式开启，该模式开启时间，玩法参与率
*/


select tt1.week_number, tt1.play_type, tt1.begin_date,
count(distinct tt1.account_id) / count(distinct t2.account_id) as paticipate_rate
from
(
select t1.week_number, "竞速模式" as play_type,
date_add(fn_firstday_week(2021,t1.week_number), interval 5 day) as begin_date,
t1.record_date, t1.account_id, t1.game_type, t1.status
from
(
select case when weekday(record_date)+1=7 then week(record_date)-1 else week(record_date) end as week_number, WEEKDAY(record_date)+1 as week_day, record_date, account_id, game_type, status from player_play_log
) t1 where game_type='A'
) tt1,
(
select case when weekday(record_date)+1=7 then week(record_date)-1 else week(record_date) end as week_number, WEEKDAY(record_date)+1 as week_day, record_date, account_id, login_type from player_loginout_log
) t2
where tt1.week_number=t2.week_number and tt1.record_date>tt1.begin_date and t2.record_date>tt1.begin_date
group by tt1.week_number,tt1.begin_date

union

select tt1.week_number, tt1.play_type, tt1.begin_date,
count(distinct tt1.account_id) / count(distinct t2.account_id) as paticipate_rate
from
(
select t1.week_number, "普通模式" as play_type,
fn_firstday_week(2021,t1.week_number) as begin_date,
t1.record_date, t1.account_id, t1.game_type, t1.status
from
(
select case when weekday(record_date)+1=7 then week(record_date)-1 else week(record_date) end as week_number, WEEKDAY(record_date)+1 as week_day, record_date, account_id, game_type, status from player_play_log
) t1 where game_type='A'
) tt1,
(
select case when weekday(record_date)+1=7 then week(record_date)-1 else week(record_date) end as week_number, WEEKDAY(record_date)+1 as week_day, record_date, account_id, login_type from player_loginout_log
) t2
where tt1.week_number=t2.week_number and tt1.record_date>tt1.begin_date and t2.record_date>tt1.begin_date
group by tt1.week_number,tt1.begin_date;
