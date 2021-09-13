-- 1
create view gameseventschedule
as
select g.game_id, g.olympiad, g.place,
       s.name as sport, v.name as venue, e.name as event,
			 case when se.gender='M' then 'male' else 'female' end as gender
from game g join `schedule` sc on sc.game_id=g.game_id
join schedule_event se on sc.schedule_id=se.schedule_id
join sport s on sc.sport_id=s.sport_id
join venue v on v.venue_id=sc.venue_id
join event e on se.event_id=e.event_id;

SELECT * FROM gameseventschedule WHERE game_id = 1;

-- 2
select s.sport_id, s.name as sport_name, v.venue_id, v.name as venue_name
from game g join schedule sc on g.game_id=sc.game_id
join sport s on s.sport_id=sc.sport_id
join venue v on sc.venue_id=v.venue_id
where g.game_id=9
and v.venue_id>=150 and v.venue_id<=160
order by venue_name;

-- 3
select s.sport_id,s.name as sport_name, count(sc.schedule_id)
from sport s join schedule sc on s.sport_id=sc.sport_id
join game g on g.game_id=sc.game_id
where g.type_of_games='Summer'
group by s.sport_id,s.name;

-- 4
select e.name as event, count(se.schedule_event_id) as schedule_num
from `schedule` sc join schedule_event se on sc.schedule_id=se.schedule_id
join event e on e.event_id=se.event_id
group by e.name
order by schedule_num desc;


-- 5
select g.place, concat(s.name,':',e.name) as sporting_event
from game g join `schedule` sc on g.game_id=sc.game_id
join sport s on sc.sport_id=s.sport_id
join schedule_event se on se.schedule_id=sc.schedule_id
join event e on se.event_id=e.event_id
where g.place='London' and g.olympiad='XXX'
and se.gender is not null
group by g.place, concat(s.name,':',e.name)
having count(distinct se.gender)=1;


-- 6
select s.*
from sport s where s.sport_id
not in
(
select s.sport_id
from game g join `schedule` sc on g.game_id=sc.game_id
join sport s on sc.sport_id=s.sport_id
where g.place='Rio' and olympiad='XXXI'
);



-- 7
# select a.first_name, a.last_name, a.country, g.game_id
# from game g join `schedule` sc on g.game_id=sc.game_id
# join schedule_event se on sc.schedule_id=se.schedule_id
# join session s on s.schedule_event_id=s.schedule_event_id
# join compete c on s.session_id=c.session_id
# join athlete a on a.athlete_id=c.athlete1_id
# group by a.athlete_id, a.first_name, a.last_name, a.country, g.game_id,
# se.schedule_event_id
# having count(c.session_id)>=20;

-- 7
select a.first_name, a.last_name, a.country, sum(t1.paticipate_sessions)
from
(
select c.athlete1_id, se.schedule_event_id, se.schedule_id, count(distinct c.session_id) as paticipate_sessions
from compete c join session s on c.session_id=s.session_id
join schedule_event se on se.schedule_event_id=s.schedule_event_id
group by c.athlete1_id, se.schedule_event_id, se.schedule_id
) t1
join
(
select se.schedule_event_id, count(s.session_id) as session_num
from schedule_event se join session s on se.schedule_event_id=s.schedule_event_id
group by se.schedule_event_id
) t2 on t1.schedule_event_id=t2.schedule_event_id and t1.paticipate_sessions=t2.session_num
join athlete a on t1.athlete1_id=a.athlete_id
join `schedule` sc on t1.schedule_id=sc.schedule_id
join game g on g.game_id=sc.game_id
where a.first_name is not null and a.first_name!=''
group by a.first_name, a.last_name, a.country
having sum(t1.paticipate_sessions)>=20;

-- 8
create view country_athlete
as
select c.code, c.name, count(a.athlete_id) as athlete_number
from athlete a join country c on a.country=c.`code`
group by c.code, c.name;

select code,name, athlete_number
from country_athlete
where athlete_number=(select max(athlete_number) from country_athlete)
union
select code,name, athlete_number
from country_athlete
where athlete_number=(select min(athlete_number) from country_athlete);


-- 9

select r.`name` as round, se.gender, concat(cn1.`name`,' (',c.team1_code,')') as team1, c.score1,
concat(cn2.`name`,' (',c.team2_code,')') as team2, c.score2
from round r join session s on r.round_id=s.round_id
join compete c on c.session_id=s.session_id
join schedule_event se on se.schedule_event_id=s.schedule_event_id
join `schedule` sc on se.schedule_id=sc.schedule_id
join game g on g.game_id=sc.game_id
join sport sp on sp.sport_id=sc.sport_id
join country cn1 on cn1.`code`=c.team1_code
join country cn2 on cn2.`code`=c.team2_code
where sp.sport_id=14
and ((g.place='London' and g.year_of_game=2012)
or (g.place='BeiJing' and g.year_of_game=2008) );


-- 10
select s.sport_id,s.name as sport_name, count(sc.schedule_id) as schedule_count
from sport s left join schedule sc on s.sport_id=sc.sport_id
left join game g on g.game_id=sc.game_id
group by s.sport_id,s.name;


-- 11


-- 12
-- 找到在里约奥约会中 所有比赛中获胜的队伍（国家），展示获胜的队伍及比分，以及比赛场所

select if(c.score1>c.score2, c.team1_code, c.team2_code) as country,
 if(c.score1>c.score2, c.score1, c.score2) as score, v.name as venue
from game g join schedule sc on g.game_id=sc.game_id
join venue v on v.venue_id=sc.venue_id
join schedule_event se on se.schedule_id=sc.schedule_id
join session s on s.schedule_event_id=se.schedule_event_id
join compete c on c.session_id=s.session_id
where c.score1 is not null and c.score2 is not null
and c.team1_code is not null and c.team2_code is not null
and c.score1!='' and c.score2!=''
and c.team1_code!='' and c.team2_code!=''
and g.game_id=1;