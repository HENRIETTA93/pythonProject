-- Q1
create view gameseventschedule
as
select g.game_id, g.olympiad, g.place,
       p.name as sport, v.name as venue, ev.name as event,
			 if(e.gender='M','male','female') as gender
from game g, schedule s, schedule_event e,
     sport p, event ev, venue v
where g.game_id=s.game_id
and s.schedule_id=e.schedule_id
and p.sport_id=s.sport_id
and e.event_id= ev.event_id
and s.venue_id=s.venue_id;

SELECT * FROM gameseventschedule WHERE game_id = 1;


-- Q2
select sp.sport_id, sp.name as sport, v.venue_id, v.name as venue
from game g, schedule s, venue v, sport sp
where g.game_id=s.game_id
and g.game_id=9
and s.venue_id=v.venue_id
and v.venue_id BETWEEN 150 and 160
and s.sport_id=sp.sport_id
order by venue;

-- Q3
select sp.sport_id,sp.name, count(s.schedule_id)  as schedule_num
from sport sp, schedule s
where sp.sport_id=s.sport_id
group by sp.sport_id,sp.name;



-- Q4
select ev.name as event_name, count(e.schedule_event_id) schedule_times
from schedule_event e  inner join schedule s  on s.schedule_id=e.schedule_id
inner join event ev on e.event_id=ev.event_id
group by ev.name
order by schedule_times desc;

-- Q5
select g.place, concat(concat(p.name,':'),ev.name) sporting_event
from schedule s inner join game g on s.game_id=g.game_id
inner join schedule_event e on e.schedule_id=s.schedule_id
inner join sport p on p.sport_id=s.sport_id
inner join event ev on e.event_id=ev.event_id
where g.olympiad='XXX' and e.gender is not null and e.gender!=''
and g.place='London'
group by g.place, concat(concat(p.name,':'),ev.name)
having count(e.gender)=1;

-- Q6
select p.sport_id, p.name
from sport p left join
(
select sport.sport_id
from sport inner join schedule on sport.sport_id=schedule.sport_id
inner join game on game.game_id=schedule.game_id
where game.place='Rio' and game.olympiad='XXXI'
) t on p.sport_id=t.sport_id
where t.sport_id is null;

-- Q7

select concat(a.first_name,' ', a.last_name) as name, a.country, count(distinct s.game_id)
from schedule s inner join schedule_event e on s.schedule_id=e.schedule_id
inner join session ss on ss.schedule_event_id=e.schedule_event_id
inner join compete c on ss.session_id=c.session_id
inner join athlete a on c.athlete1_id=a.athlete_id
group by concat(a.first_name,' ' ,a.last_name), a.country
having count(distinct s.game_id)>=20;

-- Q8
create view view_ctyandathlete
as
select code as country_code,name as country_name, count(athlete_id) as athlete_count
from country inner join athlete on country.code=athlete.country
group by code, name;


select country_code,country_name, athlete_count
from view_ctyandathlete
where athlete_count in (select max(athlete_count) from view_ctyandathlete
union
select min(athlete_count) from view_ctyandathlete
);
-- Q9
select r.name as round, e.gender, concat(ct.name,'  (', ct.code,') ') as team1, c.score1,
concat(ct2.name, '  (', ct2.code, ') ') team2, c.score2
from schedule_event e inner join schedule s on e.schedule_id=s.schedule_id
inner join session se on e.schedule_event_id=se.schedule_event_id
inner join compete c on se.session_id=c.session_id
inner join round r on r.round_id=se.round_id
inner join country ct on ct.code=c.team1_code
inner join country ct2 on ct2.code=c.team2_code
inner join game g on g.game_id=s.game_id
inner join sport p on p.sport_id=s.sport_id
where p.sport_id=14
and g.place='London' and g.year_of_game=2012
union
select r.name as round, e.gender, concat(ct.name,'  (', ct.code,') ') as team1, c.score1,
concat(ct2.name, '  (', ct2.code, ') ') team2, c.score2
from schedule_event e inner join schedule s on e.schedule_id=s.schedule_id
inner join session se on e.schedule_event_id=se.schedule_event_id
inner join compete c on se.session_id=c.session_id
inner join round r on r.round_id=se.round_id
inner join country ct on ct.code=c.team1_code
inner join country ct2 on ct2.code=c.team2_code
inner join game g on g.game_id=s.game_id
inner join sport p on p.sport_id=s.sport_id
where p.sport_id=14
and g.place='BeiJing' and g.year_of_game=2008;


-- Q10
select sp.sport_id,sp.name, count(s.schedule_id) as schedule_num
from sport sp left join schedule s on sp.sport_id=s.sport_id
group by sp.sport_id,sp.name;

-- Q12
-- 找到历届奥运会中参与的国家，并统计不同国家的运动员数量

select g.game_id, g.place, ct.code, ct.name, count(c.athlete1_id)
from game g inner join schedule s on s.game_id=s.game_id
inner join schedule_event e on e.schedule_id=s.schedule_id
inner join session ss on ss.schedule_event_id=e.schedule_event_id
inner join compete c on c.session_id=ss.session_id
inner join country ct on c.team1_code=ct.code
where c.team1_code!='' and c.team1_code is not null
group by g.game_id, g.place, ct.code, ct.name;