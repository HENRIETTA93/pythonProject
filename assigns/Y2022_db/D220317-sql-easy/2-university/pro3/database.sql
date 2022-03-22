drop table if exists plays;
drop table if exists instrument;
drop table if exists instrumental_list;
drop table if exists language;
drop table if exists vocalist;
drop table if exists set_list;
drop table if exists song;
drop table if exists concert;
drop table if exists musician;
drop table if exists band;

create table band(
name varchar(20) primary key,
genre varchar(30),
date_of_formation date
);

create table musician(
ID int primary key,
band_name varchar(20),
f_name varchar(20),
m_initial char(1),
l_name varchar(20),
dob date,
nationality varchar(30),
years_exp int,
foreign key (band_name) references band(name)
);



create table concert(
ID int primary key,
date date,
st_addr varchar(40),
city varchar(20),
state varchar(20),
country varchar(20),
capacity int
);

create table song(
name varchar(40) ,
composer int,
lyrics text,
duration int,
style varchar(30),
primary key (name, composer),
foreign key (composer) references musician(ID)
);

create table set_list(
band_name varchar(20),
conc_ID int,
song_name varchar(40),
composer int,
primary key (band_name,conc_ID,song_name,composer),
foreign key (band_name) references band(name),
foreign key (conc_ID) references concert(ID),
foreign key (song_name,composer) references song(name,composer)
);

create table vocalist(
ID int primary key,
vocal_range varchar(30),
foreign key (ID) references musician(ID)
);

create table language(
ID int,
language varchar(30),
primary key(ID,language),
foreign key (ID) references vocalist(ID)
);

create table instrumental_list(
ID int primary key,
handedness char(1) check (handedness in ('L','R')),
foreign key (ID) references musician(ID)
);

create table instrument(
name varchar(30) primary key,
type varchar(20)
);

create table plays(
instr_ID int,
instrument varchar(30),
primary key (instr_ID,instrument),
foreign key (instr_ID) references instrumental_list(ID),
foreign key (instrument) references instrument(name)
);

