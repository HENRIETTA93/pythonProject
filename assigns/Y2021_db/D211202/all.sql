drop table if exists member;
drop table if exists member_policy;
drop table if exists viewing_episode;
drop table if exists audience;
drop table if exists work_for_cases;
drop table if exists acting;
drop table if exists role_relationship;
drop table if exists roles;
drop table if exists relationship_type;
drop table if exists advert_for_season;
drop table if exists advertisement;
drop table if exists actor;
drop table if exists crew;
drop table if exists episodes;
drop table if exists seasons;
drop table if exists cases;
drop table if exists series;
create table series(
series_ID int primary key,
series_name varchar(20) not null,
series_desc text
);

create table cases(
case_ID int primary key,
case_name varchar(100) not null,
murder_intent varchar(30),
weapon varchar(20),
case_desc text,
series_ID int,
foreign key (series_ID) references series(series_ID)
);

create table seasons(
season_ID char(5) primary key,
season_start date,
season_end date
);

create table episodes(
episode_ID char(6) primary key,
episode_name varchar(100) not null,
episode_desc text,
episode_case int,
season_ID char(5),
`range` int,
foreign key (episode_case) references cases(case_ID),
foreign key (season_ID) references seasons(season_ID)
);
create table crew(
crew_ID int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
birth_date date,
gender varchar(10),
phone varchar(12),
crew_type varchar(30)
);

create table actor(
actor_ID int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
birth_date	date,
gender	varchar(10),
phone varchar(12)
);

create table advertisement(
advert_ID char(5) primary key,
advert_desc varchar(50) not null,
advert_type varchar(20)
);

create table advert_for_season(
adverting_ID int primary key,
advert_ID char(5) not null,
season_ID char(5) not null,
advert_price decimal(10,2),
advert_times int,
foreign key (advert_ID) references advertisement(advert_ID),
foreign key (season_ID) references seasons(season_ID),
unique(advert_ID,season_ID)
);

create table relationship_type(
type_ID char(5) primary key,
type_name varchar(30) not null,
type_desc text
);


create table roles(
role_ID	char(6) not null primary key,
role_name varchar(50) not null,
role_desc text,
identity varchar(30) not null,
episode_ID char(6),
foreign key (episode_ID) references episodes(episode_ID)
);

create table role_relationship(
relation_ID int primary key,
role_ID char(6) not null,
relation_role_ID char(6) not null,
type_ID char(5),
foreign key (role_ID) references roles(role_ID),
foreign key (relation_role_ID) references roles(role_ID),
foreign key (type_ID) references relationship_type(type_ID)
);


create table acting(
acting_ID int primary key,
actor_ID int,
role_ID char(6),
foreign key (actor_ID) references actor(actor_ID),
foreign key (role_ID) references roles(role_ID),
unique(actor_ID,role_ID)
);

create table work_for_cases(
working_ID int primary key,
crew_ID	int,
case_ID int,
foreign key (crew_ID) references crew(crew_ID),
foreign key (case_ID) references cases(case_ID),
unique(crew_ID,case_ID)
);

create table audience(
audience_ID	char(10) primary key,
audience_name varchar(30) not null,
age int,
is_member char(1)
);


create table viewing_episode(
viewing_ID int primary key,
audience_ID char(10),
episode_ID char(6),
from_mins int,
to_mins int,
comment text,
rating int,
foreign key (audience_ID) references audience(audience_ID),
foreign key (episode_ID) references episodes(episode_ID)
);
create table member_policy(
policy_ID char(5) primary key,
policy_type varchar(20) not null,
fee decimal(6,2)
);
create table member(
member_ID int primary key,
audience_ID char(10),
policy_ID char(5),
from_date date,
to_date date,
foreign key (audience_ID) references audience(audience_ID),
foreign key (policy_ID) references member_policy(policy_ID),
unique(audience_ID, from_date)
);





-- series
--
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (1, 'M university', 'cases that occurs in the M university');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (2, 'M Airline', 'cases that happnes within M Airline');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (3, 'MG Entertainment', 'cases that related to MG Entertainment Group');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (4, 'Historical Story', 'cases that happens in the acient time time');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (5, 'M city', 'cases that happens in the M city');
INSERT INTO `series` (`series_ID`, `series_name`, `series_desc`) VALUES (6, 'M hosipital', 'cases that happens within the M hosipital');


-- cases
--
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (1001, 'the falling of a insta star', 'love', 'knife', 'A insta famous female student was murdered', 1);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (2001, 'the flight that can''t take off ', 'family', 'poison', 'MG Airlines co-pilot found dead in the cabin with strangulation marks on his neck.', 2);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (3001, 'war between idols', 'fame', 'tie', 'The Minister of MG Entertainment was witnessed dead in the recording studio.', 3);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (4001, 'Mermaid''s Tears', 'work', 'cushion', 'The mermaid islander was found lying down in the middle of the island''s shrine.', 4);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (5001, 'The Groom Who Disappeared', 'family', 'knife', 'The body of the wedding groom was hidden in the dressing room closet.', 5);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (6001, 'Tulip Madness', 'sruvival', 'water', 'Plant geneticist found dead with a knife to the chest after everyone fainted and woke up during a flower house party.', 5);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (7001, 'Please answer 1998', 'family', 'cloth', 'The owner of Zhen Ji grocery store and Nintendo game hall was found dead in the grocery store.', 5);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (8001, 'It''s all the fault of the being beautiful', 'love', 'Poison Sting', 'The director of the Yan Beauty Plastic Surgery Hospital, known as "China''s sharpest scalpel", was found dead in his office, and his upper body had been burned.', 6);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (9001, 'Dueling at the night of the Champions League Final', 'fame', 'allergy', 'The MG Football League Golden Boot winner was found dead in the restroom of MG Ball Bar.', 5);
INSERT INTO `dzt`.`cases` (`case_ID`, `case_name`, `murder_intent`, `weapon`, `case_desc`, `series_ID`) VALUES (10001, 'hero night', 'fame', 'fish wire', 'The Winter Soldier actor collapsed during the movie shooting.', 5);

-- seasons
--
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S01', '2015-01-01', '2015-11-02');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S02', '2017-01-13', '2017-11-13');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S03', '2017-09-22', '2018-05-30');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S04', '2018-10-26', '2019-06-25');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S05', '2019-11-08', '2020-07-14');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S06', '2020-12-24', '2021-08-26');
INSERT INTO `seasons` (`season_ID`, `season_start`, `season_end`) VALUES ('S07', '2021-12-25', NULL);


-- episodes
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E1001', 'hero night 01', 'People find the victim and the detective questions suspects in a group.', 10001, 'S04', 75);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E1002', 'hero night 02', 'each player finds evidence and people discuss together.', 10001, 'S04', 120);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E101', 'the falling of a insta star 01', 'People find the victim and the detective questions suspects in a group.', 1001, 'S01', 60);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E102', 'the falling of a insta star 02', 'each player finds evidence and people discuss together.', 1001, 'S01', 80);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E201', 'the flight that can''t take off 01', 'People find the victim and the detective questions suspects in a group.', 2001, 'S02', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E202', 'the flight that can''t take off 02', 'each player finds evidence and people discuss together.', 2001, 'S02', 80);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E301', 'war between idols 01', 'People find the victim and the detective questions suspects in a group.', 3001, 'S03', 120);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E302', 'war between idols 02', 'each player finds evidence and people discuss together.', 3001, 'S03', 70);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E401', 'Mermaid''s Tears 01', 'People find the victim and the detective questions suspects in a group.', 4001, 'S04', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E402', 'Mermaid''s Tears 02', 'each player finds evidence and people discuss together.', 4001, 'S04', 70);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E501', 'The Groom Who Disappeared 01', 'People find the victim and the detective questions suspects in a group.', 5001, 'S05', 90);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E502', 'The Groom Who Disappeared 02', 'each player finds evidence and people discuss together.', 5001, 'S05', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E601', 'Tulip Madness 01', 'People find the victim and the detective questions suspects in a group.', 6001, 'S06', 100);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E602', 'Tulip Madness 02', 'each player finds evidence and people discuss together.', 6001, 'S06', 120);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E701', 'Please answer 1998 01', 'People find the victim and the detective questions suspects in a group.', 7001, 'S01', 70);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E702', 'Please answer 1998 02', 'each player finds evidence and people discuss together.', 7001, 'S01', 110);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E801', 'It''s all the fault of the being beautiful 01', 'People find the victim and the detective questions suspects in a group.', 8001, 'S02', 90);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E802', 'It''s all the fault of the being beautiful 02', 'each player finds evidence and people discuss together.', 8001, 'S02', 80);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E901', 'Dueling at the night of the Champions League Final 01', 'People find the victim and the detective questions suspects in a group.', 9001, 'S03', 90);
INSERT INTO `episodes` (`episode_ID`, `episode_name`, `episode_desc`, `episode_case`, `season_ID`, `range`) VALUES ('E902', 'Dueling at the night of the Champions League Final 02', 'each player finds evidence and people discuss together.', 9001, 'S03', 100);


-- crew
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (1, 'Xiaoling', 'Chen', '1970-12-08', 'Female', '13844563928', 'driector');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (2, 'xiaojun', 'zhao', '1985-02-03', 'Male', '13655391746', 'screenwriter');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (3, 'xiujie', 'qian', '1980-04-24', 'Male', '16294672946', 'producer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (4, 'wenjing', 'sun', '1973-04-12', 'Female', '12749264294', 'art director');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (5, 'yifan', 'li', '1987-03-09', 'Female', '13056392745', 'casting director');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (6, 'wuke', 'zhou', '1991-08-26', 'Male', '13304862946', 'director');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (7, 'tongxin', 'wu', '1998-02-14', 'Female', '18649264910', 'producer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (8, 'lei', 'zheng', '1998-04-15', 'Male', '18529462946', 'screenwriter');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (9, 'zucheng', 'wang', '1988-02-16', 'Female', '16293645815', 'prop master');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (10, 'liang', 'feng', '1998-02-17', 'Male', '15381644321', 'director of photography');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (11, 'wanxu', 'chen', '1998-02-18', 'Male', '16492649988', 'camera operator');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (12, 'xiaonan', 'zhu', '1998-02-19', 'Female', '13622773526', 'light');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (13, 'xiaobei', 'wei', '1998-02-20', 'Female', '13655492749', 'make-up artist');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (14, 'jing', 'jiang', '1998-02-21', 'Female', '13845529462', 'hair artist');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (15, 'guoqing', 'shen', '1998-02-22', 'Female', '14387665422', 'costume designer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (16, 'chang', 'han', '1998-02-23', 'Male', '14387665423', 'sound mixer');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (17, 'ke', 'liang', '1998-02-24', 'Female', '14387665424', 'vfx supervisor');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (18, 'fang', 'he', '1998-02-25', 'Male', '14387665425', 'prop maker');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (19, 'yang', 'lv', '1998-02-26', 'Male', '14387665426', 'scenic artist');
INSERT INTO `crew` (`crew_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `crew_type`) VALUES (20, 'aichen', 'shi', '1998-02-27', 'Female', '14387665427', 'gaffer');

-- actor
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (1, 'Jingting', 'Bai', '1993-10-15', 'M', '1310301231');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (2, 'Beining', 'Sa', '1976-03-23', 'M', '1310301232');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (3, 'Jiong', 'He', '1974-07-28', 'M', '1310301233');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (4, 'Ou', 'Wang', '1982-10-28', 'F', '1310301234');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (5, 'Yingjie', 'Wu', '1989-08-11', 'F', '1310301235');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (6, 'zhangwei', 'da', '1983-08-31', 'M', '1310301236');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (7, 'haoran', 'liu', '1997-10-10', 'M', '1310301237');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (8, 'ruoyun', 'zhao', '1988-08-24', 'M', '1310301238');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (9, 'daxun', 'wei', '1989-04-12', 'M', '1310301239');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (10, 'rong', 'yang', '1981-06-03', 'F', '1310301240');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (11, 'chen', 'wei', '1986-02-22', 'M', '1310301241');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (12, 'jiaer', 'wang', '1994-03-28', 'M', '1310301242');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (13, 'minghao', 'huang', '2002-02-19', 'M', '1310301243');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (14, 'songyun', 'tan', '1990-05-31', 'F', '1310301244');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (15, 'xin', 'wu', '1983-01-29', 'F', '1310301245');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (16, 'minghao', 'hou', '1997-08-03', 'M', '1310301246');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (17, 'chengcheng', 'fan', '2000-06-16', 'M', '1310301247');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (18, 'wei', 'qi', '1984-10-26', 'F', '1310301248');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (19, 'caijie', 'guo', '1986-02-19', 'F', '1310301249');
INSERT INTO `actor` (`actor_ID`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`) VALUES (20, 'zhenyu', 'qiao', '1978-11-01', 'M', '1310301250');


-- advertisement
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A01', 'oppo R11', 'oppo');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A02', 'Nongfu Spring', 'water');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A03', 'Xiaomi', 'Xiaomi');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A04', 'Mengniu Dairy', 'milk');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A05', 'Yili Group', 'yogurt');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A06', 'soul', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A07', 'pepsi', 'food');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A08', 'shenwu gaming', 'games');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A09', 'Nestlé', 'coffee');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A10', 'Robert Bosch', 'machine');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A11', 'Mead Johnson', 'powered milk');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A12', '999', 'medicine');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A13', 'sanjin', 'medicine');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A14', 'quark', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A15', 'shouba', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A16', 'Nabisco', 'oreo');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A17', 'jd.com', 'website');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A18', 'tecent', 'app');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A19', 'ikea', 'furniture');
INSERT INTO `advertisement` (`advert_ID`, `advert_desc`, `advert_type`) VALUES ('A20', 'Haier', 'television');


-- advert_for_season
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (1, 'A01', 'S01', 1999.00, 8);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (2, 'A02', 'S01', 2038.00, 10);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (3, 'A03', 'S02', 8427.00, 10);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (4, 'A04', 'S02', 20475.00, 7);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (5, 'A05', 'S02', 5497.00, 12);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (6, 'A06', 'S03', 9369.00, 15);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (7, 'A07', 'S03', 94681.00, 9);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (8, 'A08', 'S03', 88761.00, 8);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (9, 'A09', 'S04', 102948.00, 14);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (10, 'A10', 'S04', 175028.00, 18);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (11, 'A11', 'S04', 192649.00, 19);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (12, 'A12', 'S05', 240974.00, 13);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (13, 'A13', 'S05', 304857.00, 15);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (14, 'A14', 'S05', 358271.00, 20);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (15, 'A15', 'S05', 512875.00, 12);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (16, 'A16', 'S06', 487632.00, 17);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (17, 'A17', 'S06', 612534.00, 23);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (18, 'A18', 'S06', 759372.00, 24);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (19, 'A19', 'S06', 846581.00, 18);
INSERT INTO `advert_for_season` (`adverting_ID`, `advert_ID`, `season_ID`, `advert_price`, `advert_times`) VALUES (20, 'A20', 'S06', 998463.00, 28);


--  relationship_type
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t01', 'student_student', 'schoolmate');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t02', 'professor_student', 'university level');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t03', 'lover_lover', 'in a love relationship');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t04', 'acquaintance_acquaintance', 'detective with player');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t05', 'friend_friend', 'friendship');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t06', 'colleague_colleague', 'workplace ');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t07', 'supervisor_colleague', 'relationship between superior and subordinate');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t08', 'olderbrother_youngerbrother', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t09', 'odersister_youngerbrother', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t10', 'olderbrother_youngersister', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t11', 'odersister_youngersister', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t12', 'father_son', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t13', 'father_daughter', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t14', 'mother_son', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t15', 'mother_daughter', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t16', 'husband_wife', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t17', 'exhusband_exwife', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t18', 'exlover_exlover', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t19', 'grandpa_grandson', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t20', 'grandpa_granddaughter', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t21', 'grandma_grandson', 'family members');
INSERT INTO `relationship_type` (`type_ID`, `type_name`, `type_desc`) VALUES ('t22', 'grandma_granddaughter', 'family members');




-- roles
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R01', 'sa zhentan', 'a famous detective', 'detective', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R02', 'he chiqing', 'junior student of the university', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R03', 'bai laoshi', 'professor of the univeristy', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R04', 'gui xuejie', 'senior student of the university', 'murderer', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R05', 'ou xuemei', 'junior student of the university', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R06', 'qiao xuezhang', 'senior student of the university', 'suspect', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R07', 'xia qingtian', 'famous student of the university', 'victim', 'E101');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R08', 'sazhentan', 'a famous detective', 'detective', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R09', 'bai kongshao', 'a handsome flight attendant', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R10', 'gui chengwu', 'a beautiful flight attendant', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R11', 'he jianxi', 'an intern pilot', 'murderer', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R12', 'ou kongjie', 'a pretty light attendant', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R13', 'da jizhang', 'an pilot', 'suspect', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R14', 'zhen fujia', 'an pilot', 'victim', 'E102');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R15', 'gui zhentan', 'a famous detective', 'detective', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R16', 'he meinan', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R17', 'sa weixiao', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R18', 'chen wudao', 'member of man group', 'murderer', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R19', 'bai rap', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R20', 'da zhuchang', 'member of man group', 'suspect', 'E201');
INSERT INTO `roles` (`role_ID`, `role_name`, `role_desc`, `identity`, `episode_ID`) VALUES ('R21', 'zhen buzhang', 'manager of man group', 'victim', 'E201');

-- role_relationship
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (1, 'R02', 'R04', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (2, 'R02', 'R05', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (3, 'R02', 'R06', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (4, 'R02', 'R07', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (5, 'R04', 'R05', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (6, 'R04', 'R06', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (7, 'R04', 'R07', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (8, 'R05', 'R06', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (9, 'R05', 'R07', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (10, 'R06', 'R07', 't01');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (11, 'R03', 'R02', 't02');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (12, 'R03', 'R04', 't03');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (13, 'R03', 'R05', 't04');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (14, 'R03', 'R06', 't05');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (15, 'R03', 'R07', 't06');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (16, 'R02', 'R07', 't03');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (17, 'R04', 'R06', 't03');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (18, 'R01', 'R02', 't04');
INSERT INTO `role_relationship` (`relation_ID`, `role_ID`, `relation_role_ID`, `type_ID`) VALUES (19, 'R01', 'R03', 't04');




-- acting
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (1, 1, 'R01');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (2, 2, 'R02');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (3, 3, 'R03');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (4, 4, 'R04');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (5, 5, 'R05');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (6, 6, 'R06');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (7, 7, 'R07');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (8, 8, 'R08');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (9, 9, 'R09');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (10, 1, 'R10');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (11, 11, 'R11');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (12, 7, 'R12');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (13, 13, 'R13');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (14, 14, 'R14');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (15, 15, 'R15');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (16, 13, 'R16');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (17, 17, 'R17');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (18, 18, 'R18');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (19, 1, 'R19');
INSERT INTO `acting` (`acting_ID`, `actor_ID`, `role_ID`) VALUES (20, 20, 'R20');


-- work_for_cases
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (1, 1, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (4, 1, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (5, 2, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (3, 2, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (6, 3, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (7, 4, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (8, 4, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (9, 4, 3001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (11, 5, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (10, 5, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (2, 6, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (12, 6, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (13, 7, 5001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (15, 8, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (14, 8, 6001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (16, 8, 7001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (17, 8, 8001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (18, 9, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (19, 9, 5001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (20, 9, 6001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (21, 9, 9001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (22, 10, 1001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (23, 10, 2001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (24, 10, 3001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (25, 10, 4001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (26, 10, 5001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (27, 10, 6001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (28, 10, 7001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (29, 10, 8001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (30, 10, 9001);
INSERT INTO `work_for_cases` (`working_ID`, `crew_ID`, `case_ID`) VALUES (31, 10, 10001);

-- audience
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0001', 'xiaobai', 20, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0002', 'xiaowang', 20, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0003', 'xiaoli', 20, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0004', 'xiaozhang', 21, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0005', 'xiaozhou', 21, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0006', 'xiaowu', 21, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0007', 'xiaoguo', 22, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0008', 'xiaobi', 22, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0009', 'xiaozhao', 22, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0010', 'xiaoqian', 23, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0011', 'xiaosun', 23, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0012', 'xiaoliu', 23, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0013', 'xiaoke', 24, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0014', 'xiaohong', 24, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0015', 'xiaohei', 24, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0016', 'xiaozi', 25, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0017', 'xiaolv', 25, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0018', 'xiaolan', 25, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0019', 'xiaocheng', 26, 'F');
INSERT INTO `audience` (`audience_ID`, `audience_name`, `age`, `is_member`) VALUES ('A0020', 'xiaohui', 26, 'F');

-- viewing_episode

INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (1, 'A0001', 'E101', 0, 60, 'nice', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (2, 'A0002', 'E101', 10, 60, 'good', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (3, 'A0001', 'E102', 20, 60, 'not so good', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (4, 'A0002', 'E102', 0, NULL, 'average ', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (5, 'A0003', 'E201', NULL, NULL, 'great', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (6, 'A0004', 'E201', NULL, NULL, 'amazing', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (7, 'A0005', 'E202', NULL, NULL, 'nice', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (8, 'A0006', 'E202', NULL, NULL, 'good', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (9, 'A0007', 'E301', NULL, NULL, 'not so good', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (10, 'A0008', 'E302', NULL, NULL, 'average ', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (11, 'A0009', 'E401', NULL, NULL, 'great', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (12, 'A0010', 'E402', NULL, NULL, 'amazing', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (13, 'A0011', 'E501', NULL, NULL, 'nice', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (14, 'A0012', 'E502', NULL, NULL, 'good', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (15, 'A0013', 'E601', NULL, NULL, 'not so good', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (16, 'A0014', 'E602', NULL, NULL, 'average ', 3);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (17, 'A0015', 'E701', NULL, NULL, 'great', 4);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (18, 'A0016', 'E702', NULL, NULL, 'amazing', 5);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (19, 'A0017', 'E801', NULL, NULL, 'bad', 2);
INSERT INTO `viewing_episode` (`viewing_ID`, `audience_ID`, `episode_ID`, `from_mins`, `to_mins`, `comment`, `rating`) VALUES (20, 'A0018', 'E802', NULL, NULL, 'confusing', 2);

-- member_policy
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p01', 'annual', 199.00);
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p02', 'quarter', 99.00);
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p03', 'month', 39.00);
INSERT INTO `member_policy` (`policy_ID`, `policy_type`, `fee`) VALUES ('p04', 'week', 19.00);

-- member

INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (0, 'A0001', 'p01', '2021-10-10', '2022-10-10');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (2, 'A0002', 'p01', '2021-10-11', '2022-10-11');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (3, 'A0003', 'p01', '2021-10-12', '2022-10-12');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (4, 'A0004', 'p01', '2021-10-13', '2022-10-13');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (5, 'A0005', 'p01', '2021-10-14', '2022-10-14');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (6, 'A0006', 'p01', '2021-10-15', '2022-10-15');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (7, 'A0007', 'p01', '2021-10-16', '2022-10-16');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (8, 'A0008', 'p01', '2021-10-17', '2022-10-17');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (9, 'A0009', 'p01', '2021-10-18', '2022-10-18');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (10, 'A0010', 'p01', '2021-10-19', '2022-10-19');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (11, 'A0011', 'p01', '2021-10-20', '2022-10-20');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (12, 'A0012', 'p01', '2021-10-21', '2022-10-21');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (13, 'A0013', 'p01', '2021-10-22', '2022-10-22');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (14, 'A0014', 'p01', '2021-10-23', '2022-10-23');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (15, 'A0015', 'p01', '2021-10-24', '2022-10-24');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (16, 'A0016', 'p02', '2021-10-25', '2022-01-25');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (17, 'A0017', 'p02', '2021-10-26', '2022-01-26');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (18, 'A0018', 'p02', '2021-10-27', '2022-01-27');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (19, 'A0019', 'p02', '2021-10-28', '2022-01-28');
INSERT INTO `member` (`member_ID`, `audience_ID`, `policy_ID`, `from_date`, `to_date`) VALUES (20, 'A0020', 'p02', '2021-10-29', '2022-01-29');





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
-- for chang han's ID is 16, he wanted to quit work for this show because he has another better offer, so delete information with chang han
delete from work_for_cases where crew_ID=16;
delete from crew where crew_ID=16;