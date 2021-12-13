drop table if exists viral_tests;
drop table if exists sample;
drop table if exists patients;
drop table if exists sim_conn_bs;
drop table if exists citizen_sims;
drop table if exists base_stations;
drop table if exists doctors;
drop table if exists hospitals;
drop table if exists districts;



create table districts(
district_id int primary key,
district_name varchar(40),
region varchar(20) not null,
risk_level varchar(10)
);

create table hospitals(
hsptal_id char(10) primary key,
hsptal_name varchar(50) not null,
district_id int,
foreign key (district_id) references districts(district_id)
);

create table doctors(
doctor_id char(10) primary key,
doctor_name varchar(40) not null,
age int,
hsptal_id char(10),
foreign key (hsptal_id) references hospitals(hsptal_id),
check (age between 20 and 70)
);

create table base_stations(
station_id int primary key,
district_id int,
gps_longitue decimal(10,2),
gps_latitude decimal(10,2),
foreign key (district_id) references districts(district_id),
unique (district_id)
);

create table citizen_sims(
sim_id int primary key,
citizen_name varchar(20),
phone_number varchar(12),
sex varchar(10),
age int
);

create table sim_conn_bs(
sim_id int,
station_id int,
conn_time datetime,
disconn_time datetime,
primary key (sim_id,station_id,conn_time),
foreign key (sim_id) references citizen_sims(sim_id),
foreign key (station_id) references base_stations(station_id)
);


create table patients(
patient_id char(10) primary key,
sim_id int,
foreign key (sim_id) references citizen_sims(sim_id),
unique (sim_id)
);

create table sample(
sample_type varchar(40) primary key,
sample_desc text
);

create table viral_tests(
test_id int primary key,
sample_type varchar(40),
sim_id int,
sample_result varchar(20),
sample_collect_time datetime,
sample_test_time datetime,
report_time datetime,
doctor char(10),
hsptal_id char(10),
foreign key (sim_id) references citizen_sims(sim_id),
foreign key (doctor) references doctors(doctor_id),
foreign key (sample_type) references sample(sample_type),
foreign key (hsptal_id) references hospitals(hsptal_id)
);



