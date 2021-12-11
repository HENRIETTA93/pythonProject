--1.	total number of occupation(get the proportion crew) --大概稍微改复杂点就是说每个case里面的每个工作角色分别都占多少
select c.crew_type, cs.case_name, count(c.crew_ID) as crew_number
from crew c join work_for_cases wfc on c.crew_ID=wfc.crew_ID
join cases cs on cs.case_ID=wfc.case_ID
group by c.crew_type, cs.case_name;

-- 2.	proportion of each weapon (diversity of story/tool)
select weapon, round(weapon_count/t2.total_cases,2) as weapon_portion
from
(
select weapon, count(case_ID) as weapon_count
from cases
group by weapon
) t1,
(select count(*) as total_cases from cases) t2;

--3.	proportion of each type of relationships (for example, which season has the most lover’s relationship)
select s.season_ID, count(r1.role_ID) as lovers_count
from relationship_type rt join role_relationship rr on rt.type_ID=rr.type_ID
join roles r1 on r1.role_ID=rr.role_ID
join roles r2 on r2.role_ID=rr.relation_role_ID and r2.role_ID!=r1.role_ID
join episodes e on r1.episode_ID=e.episode_ID and r2.episode_ID=e.episode_ID
join seasons s on s.season_ID=e.season_ID
where rt.type_name like '%love%'
group by s.season_ID;

-- 4.	The highest cause of murder intent.

select murder_intent, count(case_ID) as intent_num
from cases
group by murder_intent
having count(case_ID)=
(
select max(intent_num)
from
(
select murder_intent, count(case_ID) as intent_num
from cases
group by murder_intent
) t
);


-- 5. 分别统计一下每个季中哪个广告的收入，并按照收入由高到低排序
select s.season_ID, ad.advert_type,sum(afs.advert_price*afs.advert_times) as total_advs
from seasons s join advert_for_season afs on s.season_ID=afs.season_ID
join advertisement ad on ad.advert_ID=afs.advert_ID
group by s.season_ID, ad.advert_type
order by total_advs desc;

-- 6.	whether people with different gender prefer to use any types of weapons

select a.gender, c.weapon,  count(e.episode_ID) as episodes_count
from cases c join episodes e on c.case_ID=e.episode_case
join roles r on r.episode_ID=e.episode_ID
join acting ac on ac.role_ID=r.role_ID
join actor a on a.actor_ID=ac.actor_ID
where r.identity='murderer'
group by a.gender, c.weapon;

-- 7.	gender proportion of cast//gender proportion of role// gender proportion of detective or murderer etc…
-- 因为role 其实每集每个角色不太一样 根据identity 去统计更好点
select roles.identity, actor.gender, count(acting.acting_ID)
from actor join acting on actor.actor_ID=acting.actor_ID
join roles on roles.role_ID=acting.role_ID
where roles.identity in ('detective','murderer')
group by roles.identity,actor.gender;


-- 8.	which season has the highest number of cases (sometimes, more than 2 episodes makes up one case)?

select seasons.season_ID, count(cases.case_ID)
from seasons join episodes on seasons.season_ID=episodes.season_ID
join cases on cases.case_ID=episodes.episode_case
group by seasons.season_ID;

-- 9.	Which season has the most diverse roles

select seasons.season_ID, count(roles.role_ID) as roles_num
from seasons join episodes on seasons.season_ID=episodes.season_ID
join roles on roles.episode_ID=episodes.episode_ID
join acting on acting.role_ID=roles.role_ID
group by seasons.season_ID
order by roles_num desc limit 1;


-- 10.	Age distribution of murderer
select roles.role_name, roles.identity, year(now())-year(birth_date) as age
from actor join acting on actor.actor_ID=acting.actor_ID
join roles on roles.role_ID=acting.role_ID
where roles.identity='murderer';

-- 11.	which actor has appeared in the most episodes?

select concat(a.first_name ,' ',a.last_name) as actor_name
from actor a join acting ac on ac.actor_ID=a.actor_ID
join roles r on r.role_ID=ac.role_ID
join episodes e on e.episode_ID=r.episode_ID
group by concat(a.first_name ,' ',a.last_name)
having count(e.episode_ID)=
(
select max(episodes_count)
from
(
select concat(a.first_name ,' ',a.last_name) as actor_name, count(e.episode_ID) as episodes_count
from actor a join acting ac on ac.actor_ID=a.actor_ID
join roles r on r.role_ID=ac.role_ID
join episodes e on e.episode_ID=r.episode_ID
group by concat(a.first_name ,' ',a.last_name)
order by count(e.episode_ID) desc
) t
);

-- 12.	rank actors by their appearances total number in the show

select concat(a.first_name ,' ',a.last_name) as actor_name, count(e.episode_ID) as episodes_count
from actor a join acting ac on ac.actor_ID=a.actor_ID
join roles r on r.role_ID=ac.role_ID
join episodes e on e.episode_ID=r.episode_ID
group by concat(a.first_name ,' ',a.last_name)
order by count(e.episode_ID) desc;


-- 13.	who plays detective/murder the most times

select 'detective' as play_role, a.actor_ID, concat(a.last_name,' ', a.first_name) as actor_name, count(ac.acting_ID) as plays_times
from roles r join acting ac on ac.role_ID=r.role_ID
join actor a on a.actor_ID=ac.actor_ID
where r.identity='detective'
group by a.actor_ID, concat(a.last_name,' ', a.first_name)
having count(ac.acting_ID)=(select count(acting_ID) from acting join roles on roles.role_ID=acting.role_ID where identity='detective' group by actor_ID order by count(acting_ID) desc limit 1)

union

select 'murderer' as play_role, a.actor_ID, concat(a.last_name,' ', a.first_name) as actor_name, count(ac.acting_ID) as plays_times
from roles r join acting ac on ac.role_ID=r.role_ID
join actor a on a.actor_ID=ac.actor_ID
where r.identity='murderer'
group by a.actor_ID, concat(a.last_name,' ', a.first_name)
having count(ac.acting_ID)=(select count(acting_ID) from acting join roles on roles.role_ID=acting.role_ID where identity='murderer' group by actor_ID order by count(acting_ID) desc limit 1);



-- Delete data from your database

delete from member;
delete from member_policy;
delete from viewing_episode;
delete from audience;
delete from work_for_cases;
delete from acting;
delete from role_relationship;
delete from roles;
delete from relationship_type;
delete from advert_for_season;
delete from advertisement;
delete from actor;
delete from crew;
delete from episodes;
delete from seasons;
delete from cases;
delete from series;

-- other delete data from database
-- d1: for chang han's ID is 16, he wanted to quit work for this show because he has another better offer, so delete information with chang han
delete from work_for_cases where crew_ID=16;
delete from crew where crew_ID=16;


--ii. Update existing data in your database
-- 修改年会员价格为219
update member_policy set fee=219 where policy_type='annual';
-- 假定id为A0009的观众购买了会员，修改其会员状态为T
update audience set is_member='T' where audience_ID='A0009';

-- trigger
-- 背景： 当一个user 买会员时，创建一个trigger 修改audience 表中的is_member 为T
drop trigger if exists trg_update_member_status;
drop trigger if exists trg_member_status_F;
delimiter $$
create trigger trg_update_member_status after insert on member
for each row
begin
update audience set is_member='T' where audience_id=new.audience_id;
end $$

-- 当member到期时从member表中删除会员信息并 修改audience表中的is_member 为F
delimiter $$
create trigger trg_member_status_F after delete on member
for each row
begin
update audience set is_member='F' where audience_id=old.audience_id;
end $$

-- test
delete from member where audience_ID='A0020';
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (20, 'A0020', 'p02', '2021-10-29', '2022-01-29');


-- transaction
-- 当 一个观众想要续订会员时，从member表中删除原有的会员记录 并新增新的会员记录,假定为 A0012
start transaction;
delete from member where audience_id='A0012';
insert into member values((select * from (select max(member_ID)+1 from member) t),'A0012','p01', now(), date_add(now(), interval 1 year)) ;
commit;


-- A view that satisfies one of your user needs
-- 这里随便选几个上述的场景建view就可以
drop view if exists actor_in_shows;
create view actor_in_shows
as
select concat(a.first_name ,' ',a.last_name) as actor_name, count(e.episode_ID) as episodes_count
from actor a join acting ac on ac.actor_ID=a.actor_ID
join roles r on r.role_ID=ac.role_ID
join episodes e on e.episode_ID=r.episode_ID
group by concat(a.first_name ,' ',a.last_name)
order by count(e.episode_ID) desc;

-- subquery 上述场景中已有多个使用了，例如：
select weapon, round(weapon_count/t2.total_cases,2) as weapon_portion
from
(
select weapon, count(case_ID) as weapon_count
from cases
group by weapon
) t1,
(select count(*) as total_cases from cases) t2;