create table player_loginout_log(
record_date datetime,
account_id varchar(20),
login_type int
);

create table player_play_log(
record_date datetime,
account_id varchar(20),
game_type char(1),
status int
);

insert into player_loginout_log values('2021-06-11 18:26:08','account_23', 1);
insert into player_loginout_log values('2021-06-11 23:20:36','account_23', 2);
insert into player_loginout_log values('2021-06-12 18:48:50','account_23', 1);
insert into player_loginout_log values('2021-06-12 21:23:53','account_23', 2);
insert into player_loginout_log values('2021-06-11 10:46:09','account_44', 1);
insert into player_loginout_log values('2021-06-11 22:21:16','account_44', 2);

insert into player_loginout_log values('2021-06-13 12:48:50','account_23', 1);
insert into player_loginout_log values('2021-06-13 21:23:53','account_23', 2);


insert into player_play_log values('2021-06-11 18:33:06','account_23','A',1);
insert into player_play_log values('2021-06-11 19:07:22','account_23','A',2);
insert into player_play_log values('2021-06-12 18:59:11','account_23','A',1);
insert into player_play_log values('2021-06-12 20:06:52','account_23','A',2);
insert into player_play_log values('2021-06-12 20:07:13','account_23','A',1);
insert into player_play_log values('2021-06-12 20:20:05','account_23','A',2);

insert into player_play_log values('2021-06-13 18:59:11','account_23','A',1);
insert into player_play_log values('2021-06-13 20:06:52','account_23','A',2);
insert into player_play_log values('2021-06-13 20:07:13','account_23','A',1);
insert into player_play_log values('2021-06-13 20:20:05','account_23','A',2);

insert into player_play_log values('2021-06-11 10:49:22','account_44','B',1);
insert into player_play_log values('2021-06-11 22:11:16','account_44','B',2);




# 1.每周不同模式的参与率
/*
普通玩法vs竞速模式参与率 当周玩法参与率= 当周玩法开启期间进入玩法的玩家数/当周玩法开启期间的活跃登录玩家数
第几周，玩法模式，该模式开启，该模式开启时间，玩法参与率
*/
select week(pl.record_date) as week_number,WEEKDAY(pl.record_date) as week_day, pl.* from player_play_log pl

select week(ll.record_date) as week_number, weekday(ll.record_date) as week_day, ll.*
from player_loginout_log ll;


select week(record_date) as week_number, weekday(record_date) as week_day, account_id
from player_loginout_log

SELECT DATE_SUB(CURDATE(),INTERVAL dayofyear(now())-1 DAY);



# 2.活动期间参与过A玩法的玩家，竞速模式参与时长占比分布
/*
竞速模式参与时长占比=活动期间A玩法竞速模式总参与时长/活动期间A玩法总参与时长
*/




drop function if exists fn_firstday_week;
delimiter ||
create function fn_firstday_week(years int, weeks int) returns varchar(20)
begin
	declare days int default 0;
	if weeks=1 then
		return concat(years,'-01-01');
	elseif weeks>1 then
		select dayofweek(concat(years,'-01-01'))-2 into days;
		return makedate(years, weeks*7-days-6);
	else
		return null;
	end if;
end||
delimiter ;

select fn_firstday_week(2021,2);


select DAYOFWEEK('2021-09-28')
select weekday('2021-09-26');

select weekOFyear('2021-01-04');

