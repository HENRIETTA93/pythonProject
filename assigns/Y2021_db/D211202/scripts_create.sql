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
foreign key (series_ID) references series(series_ID) on delete cascade on update cascade
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
foreign key (episode_case) references cases(case_ID) on delete cascade on update cascade,
foreign key (season_ID) references seasons(season_ID) on delete cascade on update cascade
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
foreign key (advert_ID) references advertisement(advert_ID) on delete cascade on update cascade,
foreign key (season_ID) references seasons(season_ID) on delete cascade on update cascade,
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
foreign key (episode_ID) references episodes(episode_ID) on delete cascade on update cascade
);

create table role_relationship(
relation_ID int primary key,
role_ID char(6) not null,
relation_role_ID char(6) not null,
type_ID char(5),
foreign key (role_ID) references roles(role_ID) on delete cascade on update cascade,
foreign key (relation_role_ID) references roles(role_ID) on delete cascade on update cascade,
foreign key (type_ID) references relationship_type(type_ID) on delete cascade on update cascade
);


create table acting(
acting_ID int primary key,
actor_ID int,
role_ID char(6),
foreign key (actor_ID) references actor(actor_ID) on delete cascade on update cascade,
foreign key (role_ID) references roles(role_ID) on delete cascade on update cascade,
unique(actor_ID,role_ID)
);

create table work_for_cases(
working_ID int primary key,
crew_ID	int,
case_ID int,
foreign key (crew_ID) references crew(crew_ID) on delete cascade on update cascade,
foreign key (case_ID) references cases(case_ID) on delete cascade on update cascade,
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
foreign key (audience_ID) references audience(audience_ID) on delete cascade on update cascade,
foreign key (episode_ID) references episodes(episode_ID) on delete cascade on update cascade
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
foreign key (audience_ID) references audience(audience_ID) on delete cascade on update cascade,
foreign key (policy_ID) references member_policy(policy_ID) on delete cascade on update cascade,
unique(audience_ID, from_date)
);