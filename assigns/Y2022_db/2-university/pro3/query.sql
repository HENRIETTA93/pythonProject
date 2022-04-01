insert into band values ('westlife','pop','1999-01-01');
insert into band values ('Linkin Park','genre2','1999-01-01');
insert into band values ('beyond','genre3','1999-01-01');
insert into band values ('band4','genre4','1999-01-01');


insert into musician values (1, 'westlife', 'Kian','J','Egan', '1980-04-29', 'England', '20');
insert into musician values (2, 'westlife', 'Shane','S','Filan', '1979-07-05', 'England', '20');
insert into musician values (3, 'westlife', 'Markus','M','Feehily', '1980-05-28', 'England', '20');
insert into musician values (4, 'westlife', 'Nicky','B','Byrne', '1978-10-09', 'England', '20');


insert into concert values (1, '2021-12-17', 'Center park', 'London', 'London', 'England',100);
insert into concert values (2, '2019-10-17', 'ShangHai Stadium', 'ShangHai', 'ShangHai', 'China',1000);
insert into concert values (3, '2011-10-10', 'Center park', 'London', 'London', 'England',200);
insert into concert values (4, '2010-10-02', 'Center park', 'London', 'London', 'England',1500);


insert into song values ('Hello My Love',4,'No one knows...',214, 'pop');
insert into song values ('Better Man',3,'You and I had something special, baby',197, 'pop');
insert into song values ('Dynamite',1,'Last night...',212, 'pop');
insert into song values ('Take Me There',2,'We used to drive all night...',205, 'pop');


INSERT INTO set_list (band_name, conc_ID, song_name, composer) VALUES ('westlife', 1, 'Hello My Love', 4);
INSERT INTO set_list (band_name, conc_ID, song_name, composer) VALUES ('westlife', 2, 'Dynamite', 1);
INSERT INTO set_list (band_name, conc_ID, song_name, composer) VALUES ('westlife', 3, 'Take Me There', 2);
INSERT INTO set_list (band_name, conc_ID, song_name, composer) VALUES ('westlife', 2, 'Hello My Love', 4);
INSERT INTO set_list (band_name, conc_ID, song_name, composer) VALUES ('westlife', 4, 'Take Me There', 2);

INSERT INTO vocalist (ID, vocal_range) VALUES (1, 'High');
INSERT INTO vocalist (ID, vocal_range) VALUES (2, 'Medium');
INSERT INTO vocalist (ID, vocal_range) VALUES (3, 'Medium-Low');
INSERT INTO vocalist (ID, vocal_range) VALUES (4, 'Low');


INSERT INTO instrument (name, type) VALUES ('violin', 'type1');
INSERT INTO instrument (name, type) VALUES ('instrument2', 'type2');
INSERT INTO instrument (name, type) VALUES ('instrument3', 'type2');
INSERT INTO instrument (name, type) VALUES ('instrument4', 'type3');


INSERT INTO instrumental_list (ID, handedness) VALUES (1, 'L');
INSERT INTO instrumental_list (ID, handedness) VALUES (2, 'R');
INSERT INTO instrumental_list (ID, handedness) VALUES (3, 'L');
INSERT INTO instrumental_list (ID, handedness) VALUES (4, 'R');


INSERT INTO language (ID, language) VALUES (1, 'English');
INSERT INTO language (ID, language) VALUES (2, 'English');
INSERT INTO language (ID, language) VALUES (3, 'English');
INSERT INTO language (ID, language) VALUES (3, 'Spanish');
INSERT INTO language (ID, language) VALUES (4, 'English');


INSERT INTO plays (instr_ID, instrument) VALUES (1, 'instrument2');
INSERT INTO plays (instr_ID, instrument) VALUES (2, 'violin');
INSERT INTO plays (instr_ID, instrument) VALUES (3, 'instrument4');
INSERT INTO plays (instr_ID, instrument) VALUES (4, 'instrument3');



-- queries

-- query 1
-- 查询westlife 乐队中年纪最大的musician 和他演奏过的instrument，display first name, last name, 和乐器信息

select m.f_name, m.l_name, i.name as instrument, i.type
from musician m
join instrumental_list il on m.ID=il.ID
join plays p on p.instr_ID=il.ID
join instrument i on i.name=p.instrument;




-- query 2

-- 查询每个组合所举办的演唱会的次数, 其中 没有办过演唱会的应该显示为0

select b.name, count(sl.conc_ID) as concert_count
from band b
left join set_list sl on b.name=sl.band_name
group by b.name;


-- query 3
-- 查询在2021年以及2011年所举办的演唱会中，演唱次数最多的歌曲。display 为 年份，most_played_song

select concert_year, song_name as most_played_name
from
(
select '2021' as concert_year, sl.song_name
from concert c
join set_list sl on c.ID= sl.conc_ID
where year(c.date)=2021
group by sl.song_name
order by count(sl.song_name) desc limit 1
) t
union
select concert_year, song_name as most_played_name
from
(
select '2011' as concert_year, sl.song_name
from concert c
join set_list sl on c.ID= sl.conc_ID
where year(c.date)=2011
group by sl.song_name
order by count(sl.song_name) desc limit 1
) t1;

-- query 4
-- 查询在同一个城市举办了2次以上的乐队，列出举办城市，乐队名称，及次数
select c.city, sl.band_name, count(c.ID) as concert_count
from concert c
join set_list sl on c.ID=sl.conc_ID
group by c.city, sl.band_name
having count(c.ID)>=2;


-- query 5
-- 查询 参与了1首及以上歌曲创作的musician 并且该歌手来自英国或美国， 列出该歌手的名字，国籍以及经验，以及乐器习惯用手
select m.f_name, m.l_name, m.nationality, m.years_exp, il.handedness
from
(
select composer, count(name)
from song s
group by composer having count(name)>=1
) s
join musician m on s.composer=m.ID
join instrumental_list il on il.ID=m.ID
where m.nationality in ('England','USA');

-- update

update musician set band_name = (select name from band where name='beyond')
where band_name='westlife';

select * from musician;