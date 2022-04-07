-- q3
drop index idx_date on band;
drop index idx_songname on song;
drop index idx_concert on concert;

create index idx_date on band(date_of_formation);
create index idx_songname on song(name);
create index idx_concert on concert(country);

select *
from band
where date_of_formation between '2000-01-01' and '2001-12-31';

select *
from song
where name='dolorum';

select band.name
from band
join set_list on band.ID=set_list.band
join concert on concert.ID=set_list.conc_ID
where country='Poland';

-- 解释： 索引可以加快查询的速度

-- q4
-- 查询在演唱会中，每个genre 在不同的state ，country中被演唱过的歌曲的数量
create view vw
as
select b.genre, c.state, c.country, count(s.ID) as song_number
from band b
join set_list sl on sl.band=b.ID
join concert c on c.ID=sl.conc_ID
join song s on s.ID=sl.song
group by b.genre, c.state, c.country;


-- 使用试图查询
select * from vw where country='Poland';

-- 等效查询
select b.genre, c.state, c.country, count(s.ID) as song_number
from band b
join set_list sl on sl.band=b.ID
join concert c on c.ID=sl.conc_ID
join song s on s.ID=sl.song
where country='Poland'
group by b.genre, c.state, c.country;


-- 尝试更新试图
update vw set song_number=100 where country='Poland';
/*
错误
SQL 查询：


update vw set song_number=100 where country='Poland'
MySQL 返回： 文档

#1288 - The target table vw of the UPDATE is not updatable
*/