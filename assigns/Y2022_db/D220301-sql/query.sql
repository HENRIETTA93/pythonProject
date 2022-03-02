create table publisher(
pub_id int primary key,
pub_name varchar(50),
impact_factor varchar(30)
);

create table publication(
doi varchar(20) primary key,
title varchar(50),
research_area varchar(30),
publish_year int,
pub_id int,
foreign key (pub_id) references publisher(pub_id)
);

create table university(
uni_rank int primary key,
name varchar(30),
address varchar(50),
estabish_date date
);

create table author(
email_id varchar(30) primary key,
first_name varchar(20),
last_name varchar(20),
degree varchar(20),
gender char(1) check(gender in ('F','M')),
exper_years int,
uni_rank int,
foreign key (uni_rank) references university(uni_rank)
);

create table writes(
doi varchar(20),
email_id varchar(30),
primary key (doi, email_id),
foreign key (doi) references publication(doi),
foreign key (email_id) references author(email_id)
);


-- assuming the particular publisher is pubA and the particular area is areaA,and publish year is 2021
select p2.*
from publisher p1
join publication p2 on p1.pub_id=p2.pub_id
where p1.pub_name ='pubA'
and p2.research_area='areaA'
and p2.publish_year=2021;