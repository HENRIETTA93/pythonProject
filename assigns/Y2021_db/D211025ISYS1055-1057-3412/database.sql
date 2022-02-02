drop table locations;

create table locations(
location varchar(30) primary key,
iso_code char(10)  not null
);

create table vaccines (
vaccine_type varchar(100) primary key
);
create table location_vaccines(
location varchar(30) ,
vaccine_type varchar(100),
last_observation_date date,
source_name text,
source_website text,
foreign key (location) references locations(location),
foreign key (vaccine_type) references vaccines(vaccine_type)
);

create table vaccinations(
location varchar(30),
date date,
total_vaccinations int,
people_vaccinated int,
people_fully_vaccinated int,
total_boosters int,
daily_vaccinations_raw int,
daily_vaccinations int,
total_vaccinations_per_hundred float,
people_vaccinated_per_hundred float,
people_fully_vaccinated_per_hundred float,
total_boosters_per_hundred float,
daily_vaccinations_per_million float,
primary key (location, date),
foreign key (location) references locations(location)
);
create table us_state_vaccinations(
date date,
location varchar(30),
total_vaccinations int,
total_distributed int,
people_vaccinated int,
people_fully_vaccinated_per_hundred float,
total_vaccinations_per_hundred float,
people_fully_vaccinated int,
people_vaccinated_per_hundred float,
distributed_per_hundred float,
daily_vaccinations_raw int,
daily_vaccinations int,
daily_vaccinations_per_million float,
share_doses_used int,
primary key (date,location),
foreign key (location) references locations(location)
);



create table country_vaccination(
date date,
location varchar(30),
total_vaccinations int,
people_vaccinated int,
people_fully_vaccinated int,
total_boosters int,
vaccine varchar(100),
source_url text,
primary key (date, location),
foreign key (location) references locations(location)
);

create table vaccinations_by_age(
location varchar(30),
date date,
age_group varchar(20),
people_vaccinated_per_hundred float,
people_fully_vaccinated_per_hundred float,
primary key (location,date,age_group),
foreign key (location) references locations(location)
);
create table vaccinations_by_manufacturer(
location varchar(30),
date date,
vaccine varchar(100),
total_vaccinations int,
primary key (location,date, vaccine),
foreign key (location) references locations(location),
  foreign key (vaccine) REFERENCES vaccines(vaccine)
);



insert into locations select distinct location, iso_code from locations1;

insert into vaccines
select distinct vaccine from "vaccinations-by-manufacturer";

insert into location_vaccines select distinct t1.location, t2.vaccine, t1.last_observation_date, t1.source_name, t1.source_website
from locations1 t1, "vaccinations-by-manufacturer" t2
where instr(t1.vaccines, t2.vaccine)>0;

-- select count(distinct source_website), count(distinct source_name)
-- from location_vaccines;

insert into vaccinations
select distinct location, date, total_vaccinations, people_vaccinated, people_fully_vaccinated,
total_boosters, daily_vaccinations_raw,
daily_vaccinations,
total_vaccinations_per_hundred,
people_vaccinated_per_hundred,
people_fully_vaccinated_per_hundred,
total_boosters_per_hundred,
daily_vaccinations_per_million
from vaccinations1;

insert into us_state_vaccinations
select distinct
date,
location,
total_vaccinations,
total_distributed ,
people_vaccinated ,
people_fully_vaccinated_per_hundred ,
total_vaccinations_per_hundred ,
people_fully_vaccinated ,
people_vaccinated_per_hundred ,
distributed_per_hundred,
daily_vaccinations_raw ,
daily_vaccinations ,
daily_vaccinations_per_million ,
share_doses_used
from us_state_vaccinations1;

insert into country_vaccination
select
distinct
date,
location,
total_vaccinations,
people_vaccinated,
people_fully_vaccinated,
total_boosters,
vaccine,
source_url
from Australia
union
select
distinct
date,
location,
total_vaccinations,
people_vaccinated,
people_fully_vaccinated,
total_boosters,
vaccine,
source_url
from France
union
select
distinct
date,
location,
total_vaccinations,
people_vaccinated,
people_fully_vaccinated,
total_boosters,
vaccine,
source_url
from Israel
union
select
distinct
date,
location,
total_vaccinations,
people_vaccinated,
people_fully_vaccinated,
total_boosters,
vaccine,
source_url
from "United States"
;

insert into vaccinations_by_age
select
distinct
location,
date,
age_group,
people_vaccinated_per_hundred ,
people_fully_vaccinated_per_hundred
from "vaccinations-by-age-group";

insert into vaccinations_by_manufacturer
select
distinct
location,
date,
vaccine,
total_vaccinations
from "vaccinations-by-manufacturer";
