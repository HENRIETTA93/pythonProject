-- create tables

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



-- insert all test datas

INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (1, 'Centre Lukewarm Hillside', 'central', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (2, 'Lenny town', 'north', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (3, 'Glow Sand district', 'east', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (4, 'Raspberry town', 'central', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (5, 'Bunny Tail district', 'north', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (6, 'Luckwam distrct 6', 'central', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (7, 'Luckwam distrct 7', 'east', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (8, 'Luckwam distrct 8', 'south', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (9, 'Luckwam distrct 9', 'north', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (10, 'Luckwam distrct 10', 'west', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (11, 'Luckwam distrct 11', 'central', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (12, 'Luckwam distrct 12', 'south', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (13, 'Luckwam distrct 13', 'north', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (14, 'Luckwam distrct 14', 'west', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (15, 'Luckwam distrct 15', 'south', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (16, 'Luckwam distrct 16', 'central', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (17, 'Luckwam distrct 17', 'west', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (18, 'Luckwam distrct 18', 'central', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (19, 'Luckwam distrct 19', 'west', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (20, 'Luckwam distrct 20', 'west', '');
INSERT INTO districts (district_id, district_name, region, risk_level) VALUES (21, 'Luckwam distrct 21', 'central', '');




INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00001', 'Central Lukewarm Kingdom Hospital', 1);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00002', 'North Lukewarm Kingdom Hospital', 2);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00003', 'People of Lukewarm Kingdom Hospital', 1);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00004', 'Luis Hospital', 2);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00005', 'FWW Hospital', 3);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00006', 'Williams Hospital', 4);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00007', 'R1 Hostpital', 5);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00008', 'R2 Hostpital', 6);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00009', 'R3 Hostpital', 7);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00010', 'R4 Hostpital', 8);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00011', 'R5 Hostpital', 9);
INSERT INTO hospitals (hsptal_id, hsptal_name, district_id) VALUES ('HSPT00012', 'R6 Hostpital', 10);


INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0001', 'Jun Qi', 34, 'HSPT00001');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0002', 'Doctor 2', 45, 'HSPT00001');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0003', 'Doctor 3', 23, 'HSPT00001');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0004', 'Doctor 4', 45, 'HSPT00002');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0005', 'Doctor 5', 45, 'HSPT00002');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0006', 'Doctor 6', 46, 'HSPT00002');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0007', 'Doctor 7', 57, 'HSPT00003');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0008', 'Doctor 8', 54, 'HSPT00003');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0009', 'Doctor 9', 55, 'HSPT00004');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0010', 'Doctor 10', 56, 'HSPT00004');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0011', 'Doctor 11', 57, 'HSPT00005');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0012', 'Doctor 12', 36, 'HSPT00006');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0013', 'Doctor 13', 37, 'HSPT00007');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0014', 'Doctor 14', 38, 'HSPT00008');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0015', 'Doctor 15', 39, 'HSPT00009');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0016', 'Doctor 16', 40, 'HSPT00010');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0017', 'Doctor 17', 25, 'HSPT00011');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0018', 'Doctor 18', 56, 'HSPT00012');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0019', 'Doctor 19', 28, 'HSPT00012');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0020', 'Doctor 20', 34, 'HSPT00012');
INSERT INTO doctors (doctor_id, doctor_name, age, hsptal_id) VALUES ('DT0021', 'Doctor 21', 36, 'HSPT00012');


INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (201, 1, 8923.23, 3231.32);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (202, 2, 323.21, 2121.32);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (203, 3, 2132.43, 1321.43);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (204, 4, 3231.13, 3123.34);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (205, 5, 13223.10, 32321.10);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (206, 6, 8430.32, 42342.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (207, 7, 8431.32, 42343.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (208, 8, 8432.32, 42344.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (209, 9, 8433.32, 42345.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (210, 10, 8434.32, 42346.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (211, 11, 8435.32, 42347.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (212, 12, 8436.32, 42348.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (213, 13, 8437.32, 42349.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (214, 14, 8438.32, 42350.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (215, 15, 8439.32, 42351.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (216, 16, 8440.32, 42352.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (217, 17, 8441.32, 42353.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (218, 18, 8442.32, 42354.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (219, 19, 8443.32, 42355.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (220, 20, 8444.32, 42356.20);
INSERT INTO base_stations (station_id, district_id, gps_longitue, gps_latitude) VALUES (221, 21, 8445.32, 42357.20);



INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1001, 'Mark', '233636', 'Male', 25);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1002, 'William', '3213123', 'Male', 26);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1003, 'John', '3423423', 'Male', 27);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1004, 'Colin', '3212123', 'Male', 28);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1005, 'July', '232324', 'Female', 29);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1006, 'Maple', '232323432', 'Female', 34);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1007, 'Tuple', '3233231', 'Male', 67);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1008, 'Dan', '12343545', 'Male', 76);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1009, 'Chen Jiajun', '233435321', 'Male', 70);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1010, 'Citizen10', '313435', 'Male', 67);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1011, 'Citizen11', '2122321', 'Female', 89);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1012, 'Citizen12', '2122322', 'Female', 22);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1013, 'Citizen13', '42322323', 'Female', 23);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1014, 'Citizen14', '2122324', 'Male', 12);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1015, 'Citizen15', '21432325', 'Male', 67);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1016, 'Citizen16', '2122326', 'Female', 78);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1017, 'Citizen17', '21322327', 'Male', 35);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1018, 'Citizen18', '2122328', 'Female', 36);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1019, 'Citizen19', '2662329', 'Male', 89);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1020, 'Citizen20', '78892330', 'Female', 28);
INSERT INTO citizen_sims (sim_id, citizen_name, phone_number, sex, age) VALUES (1021, 'Citizen21', '2122331', 'Male', 56);


INSERT INTO patients (patient_id, sim_id) VALUES ('p0001', 1001);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0002', 1002);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0003', 1003);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0004', 1004);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0005', 1006);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0006', 1007);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0007', 1009);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0008', 1012);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0009', 1013);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0010', 1014);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0011', 1015);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0012', 1016);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0013', 1017);
INSERT INTO patients (patient_id, sim_id) VALUES ('p0014', 1018);


INSERT INTO sample (sample_type, sample_desc) VALUES ('Coughid-21', 'Coughid-21 is a newly identified type of virus this year, all patients tested to be positive should rest well and avoid going outside');
INSERT INTO sample (sample_type, sample_desc) VALUES ('Coughid-22', 'Coughid-22 is a newly…');
INSERT INTO sample (sample_type, sample_desc) VALUES ('Coughid-23', 'Coughid-23 is a newly…');
INSERT INTO sample (sample_type, sample_desc) VALUES ('Coughid-24', 'Coughid-24 is a newly…');
INSERT INTO sample (sample_type, sample_desc) VALUES ('Coughid-25', 'Coughid-25 is a newly…');
INSERT INTO sample (sample_type, sample_desc) VALUES ('Coughid-26', 'Coughid-26 is a newly…');
INSERT INTO sample (sample_type, sample_desc) VALUES ('Coughid-27', 'Coughid-27 is a newly…');



INSERT INTO sim_conn_bs VALUES (1001, 201, '2021-10-08 19:23:00', '2021-10-08 22:23:00');
INSERT INTO sim_conn_bs VALUES (1002, 201, '2021-10-08 19:23:01', '2021-10-08 22:23:01');
INSERT INTO sim_conn_bs VALUES (1003, 201, '2021-10-08 19:23:02', '2021-10-08 22:23:02');
INSERT INTO sim_conn_bs VALUES (1004, 201, '2021-10-08 19:23:03', '2021-10-08 22:23:03');
INSERT INTO sim_conn_bs VALUES (1006, 201, '2021-10-08 19:23:04', '2021-10-08 22:23:04');
INSERT INTO sim_conn_bs VALUES (1007, 201, '2021-10-08 19:23:05', '2021-10-08 22:23:05');
INSERT INTO sim_conn_bs VALUES (1009, 201, '2021-10-08 19:23:06', '2021-10-08 22:23:06');
INSERT INTO sim_conn_bs VALUES (1012, 202, '2021-12-03 10:00:00', '2021-12-06 10:20:00');
INSERT INTO sim_conn_bs VALUES (1013, 202, '2021-12-03 10:00:01', '2021-12-07 10:20:00');
INSERT INTO sim_conn_bs VALUES (1014, 202, '2021-12-03 10:00:02', '2021-12-08 10:20:00');
INSERT INTO sim_conn_bs VALUES (1015, 203, '2021-12-04 11:00:03', '2021-12-05 11:00:03');
INSERT INTO sim_conn_bs VALUES (1016, 203, '2021-12-04 11:00:04', '2021-12-05 11:00:04');
INSERT INTO sim_conn_bs VALUES (1017, 203, '2021-12-04 11:00:05', '2021-12-05 11:00:05');
INSERT INTO sim_conn_bs VALUES (1018, 203, '2021-12-04 11:00:06', '2021-12-05 11:00:06');

INSERT INTO sim_conn_bs VALUES (1010, 201, '2021-12-02 11:00:05', '2021-12-03 21:00:05');
INSERT INTO sim_conn_bs VALUES (1005, 201, '2021-12-03 14:00:06', '2021-12-04 11:00:06');
INSERT INTO sim_conn_bs VALUES (1011, 201, '2021-12-04 11:00:05', '2021-12-05 21:00:05');
INSERT INTO sim_conn_bs VALUES (1019, 201, '2021-12-06 14:00:06', '2021-12-09 11:00:06');

INSERT INTO sim_conn_bs VALUES (1003, 201, '2021-10-09 10:30:00', '2021-11-03 21:00:05');
INSERT INTO sim_conn_bs VALUES (1006, 201, '2021-10-10 07:30:00', '2021-11-04 11:00:06');
INSERT INTO sim_conn_bs VALUES (1009, 201, '2021-10-10 09:30:00', '2021-11-05 21:00:05');
INSERT INTO sim_conn_bs VALUES (1012, 201, '2021-10-10 00:30:00', '2021-11-09 11:00:06');
INSERT INTO sim_conn_bs VALUES (1015, 201, '2021-10-19 02:30:00', '2021-11-09 11:00:06');



INSERT INTO viral_tests VALUES ( 1, 'Coughid-21', 1001, 'negative', '2021-10-03 10:30:00', '2021-10-04 14:30:00', '2021-10-04 16:30:00', 'DT0002', 'HSPT00001');
INSERT INTO viral_tests VALUES ( 2, 'Coughid-21', 1001, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES ( 3, 'Coughid-21', 1005, 'positive', '2021-10-04 10:30:00', '2021-10-04 14:30:00', '2021-10-04 16:30:00', 'DT0002', 'HSPT00001');
INSERT INTO viral_tests VALUES ( 4, 'Coughid-21', 1011, 'positive', '2021-10-05 10:30:00', '2021-10-05 14:30:00', '2021-10-05 16:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES ( 5, 'Coughid-21', 1010, 'positive', '2021-10-04 10:30:00', '2021-10-04 13:30:00', '2021-10-04 17:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES ( 6, 'Coughid-21', 1019, 'negative', '2021-10-07 10:30:00', '2021-10-07 14:30:00', '2021-10-07 18:30:00', 'DT0002', 'HSPT00001');

INSERT INTO viral_tests VALUES ( 7, 'Coughid-21', 1003, 'positive', '2021-10-09 20:30:00', '2021-10-10 14:30:00', '2021-10-10 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES ( 8, 'Coughid-21', 1006, 'negative', '2021-10-10 10:30:00', '2021-10-11 14:30:00', '2021-10-11 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES ( 9, 'Coughid-21', 1009, 'positive', '2021-10-10 10:30:00', '2021-10-19 14:30:00', '2021-10-19 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (10, 'Coughid-21', 1012, 'negative', '2021-10-10 10:30:00', '2021-10-12 14:30:00', '2021-10-12 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (11, 'Coughid-21', 1015, 'negative', '2021-10-19 20:30:00', '2021-10-19 22:30:00', '2021-10-19 19:30:00', 'DT0001', 'HSPT00001');

INSERT INTO viral_tests VALUES (12, 'Coughid-21', 1001, 'negative', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (13, 'Coughid-21', 1002, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (14, 'Coughid-21', 1003, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (15, 'Coughid-21', 1004, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (16, 'Coughid-21', 1005, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (17, 'Coughid-21', 1006, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (18, 'Coughid-21', 1007, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0001', 'HSPT00001');

INSERT INTO viral_tests VALUES (19, 'Coughid-21', 1009, 'negative', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0002', 'HSPT00001');
INSERT INTO viral_tests VALUES (20, 'Coughid-21', 1010, 'positive', '2021-10-09 10:30:00', '2021-10-09 14:30:00', '2021-10-09 19:30:00', 'DT0005', 'HSPT00002');
INSERT INTO viral_tests VALUES (21, 'Coughid-21', 1011, 'negative', '2021-11-19 20:30:00', '2021-11-19 22:30:00', '2021-11-19 19:30:00', 'DT0005', 'HSPT00002');
INSERT INTO viral_tests VALUES (22, 'Coughid-21', 1012, 'negative', '2021-12-01 10:30:00', '2021-12-01 14:30:00', '2021-12-01 19:30:00', 'DT0006', 'HSPT00002');
INSERT INTO viral_tests VALUES (23, 'Coughid-21', 1020, 'negative', '2021-12-01 10:30:00', '2021-12-01 14:30:00', '2021-12-01 19:30:00', 'DT0006', 'HSPT00002');
INSERT INTO viral_tests VALUES (24, 'Coughid-21', 1013, 'negative', '2021-12-02 10:30:00', '2021-12-02 14:30:00', '2021-12-02 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (25, 'Coughid-21', 1014, 'negative', '2021-12-02 10:30:00', '2021-12-02 14:30:00', '2021-12-02 19:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (26, 'Coughid-21', 1015, 'negative', '2021-12-02 10:30:00', '2021-12-02 14:30:00', '2021-12-02 19:30:00', 'DT0007', 'HSPT00003');
INSERT INTO viral_tests VALUES (27, 'Coughid-21', 1019, 'negative', '2021-12-02 10:30:00', '2021-12-02 14:30:00', '2021-12-02 19:30:00', 'DT0008', 'HSPT00003');
INSERT INTO viral_tests VALUES (28, 'Coughid-21', 1018, 'negative', '2021-12-02 10:30:00', '2021-12-02 14:30:00', '2021-12-02 19:30:00', 'DT0008', 'HSPT00003');
INSERT INTO viral_tests VALUES (29, 'Coughid-21', 1005, 'negative', '2021-10-03 10:30:00', '2021-10-03 14:30:00', '2021-10-03 16:30:00', 'DT0002', 'HSPT00001');
INSERT INTO viral_tests VALUES (30, 'Coughid-21', 1011, 'negative', '2021-10-03 10:30:00', '2021-10-03 14:30:00', '2021-10-03 16:30:00', 'DT0001', 'HSPT00001');
INSERT INTO viral_tests VALUES (31, 'Coughid-21', 1010, 'negative', '2021-10-03 10:30:00', '2021-10-03 13:30:00', '2021-10-03 17:30:00', 'DT0001', 'HSPT00001');


update districts set risk_level='high' where district_name='Centre Lukewarm Hillside' or
district_name='Glow Sand district' or
district_name='Lenny town';

update districts set risk_level='mid' where district_name='Raspberry town';

update districts set risk_level='low' where district_name not in ('Centre Lukewarm Hillside', 'Glow Sand district','Lenny town', 'Raspberry town');


-- use cases
-- use case 1
select distinct scb.station_id,
cs2.phone_number
from citizen_sims cs
join sim_conn_bs scb on scb.sim_id=cs.sim_id
join viral_tests vt on vt.sim_id=cs.sim_id
join sim_conn_bs scb2 on scb.station_id=scb2.station_id
join citizen_sims cs2 on cs2.sim_id=scb2.sim_id and scb2.sim_id!=scb.sim_id
where vt.report_time='2021-10-09 19:30:00' and cs.phone_number='233636'
and vt.sample_result='positive';

-- use case 2

INSERT INTO sim_conn_bs VALUES (1020, 204, '2021-12-05 13:00:00', null);
UPDATE sim_conn_bs SET disconn_time='2021-12-05 13:00:00' WHERE sim_id=1020 AND station_id=204 AND conn_time='2021-12-05 13:00:00';

INSERT INTO sim_conn_bs VALUES (1021, 204, '2021-12-05 14:00:00', null);

UPDATE sim_conn_bs SET disconn_time='2021-12-05 15:00:00' WHERE sim_id=1021 AND station_id=204 AND conn_time='2021-12-05 14:00:00';

-- use case 3
select h.hsptal_id, h.hsptal_name, avg(timestampdiff(hour,vt.sample_test_time,vt.report_time)) as avg_report_gen_time
from viral_tests vt join hospitals h on h.hsptal_id=vt.hsptal_id
group by h.hsptal_id, h.hsptal_name;

-- use case 4
select cs.phone_number
from citizen_sims cs join viral_tests vt on vt.sim_id=cs.sim_id
where sample_test_time between '2021-10-03 00:00' and '2021-10-05 00:00'
group by cs.phone_number
having count(vt.test_id)>=2;

-- use case 5
select d.district_name, d.risk_level
from districts d join base_stations bs on d.district_id=bs.district_id
where d.risk_level='high'
union
select d.district_name, d.risk_level
from districts d join base_stations bs on d.district_id=bs.district_id
where d.risk_level='mid'
union
select d.district_name, d.risk_level
from districts d join base_stations bs on d.district_id=bs.district_id
where d.risk_level='low';
-- use case 6
select cs.citizen_name, cs.phone_number
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-04%';
-- use case 7
select t1.district_id, t1.district_name, t2.positive_num-t1.positive_num as increment
from
(
select d.district_id, d.district_name, count(distinct cs.sim_id) as positive_num
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-04%'
group by d.district_id, d.district_name
) t1
join
(

select d.district_id, d.district_name, count(distinct cs.sim_id) as positive_num
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-05%'
group by d.district_id, d.district_name
) t2 on t1.district_id=t2.district_id and t1.district_name=t2.district_name
;

-- use case 8

select t2.positive_14_numbers/t1.total_48_numbers as infection_rate
from
(
select count(scb1.sim_id) as total_48_numbers
from
(
select scb.station_id, vt.report_time as from_time, date_add(vt.report_time, interval 48 hour) as to_time
from citizen_sims cs
join sim_conn_bs scb on scb.sim_id=cs.sim_id
join viral_tests vt on vt.sim_id=cs.sim_id
where vt.report_time='2021-10-09 19:30:00' and cs.phone_number='233636'
and vt.sample_result='positive'
) t
join sim_conn_bs scb1 on scb1.station_id=t.station_id
where scb1.conn_time between t.from_time and t.to_time
) t1,
(
select count(distinct scb1.sim_id) as positive_14_numbers
from
(
select scb.station_id, cs.sim_id, vt.report_time as from_time, date_add(vt.report_time, interval 14 day) as to_time
from citizen_sims cs
join sim_conn_bs scb on scb.sim_id=cs.sim_id
join viral_tests vt on vt.sim_id=cs.sim_id
where vt.report_time='2021-10-09 19:30:00' and cs.phone_number='233636'
and vt.sample_result='positive'
) t
join sim_conn_bs scb1 on scb1.station_id=t.station_id
join viral_tests vt1 on vt1.sim_id=scb1.sim_id and vt1.sim_id!=t.sim_id
where vt1.report_time between t.from_time and t.to_time
and vt1.sample_result='positive'
) t2;

-- extended use cases
-- case 1

select d.doctor_id, d.doctor_name, count(vt.test_id)
from doctors d left join viral_tests vt on d.doctor_id=vt.doctor
group by d.doctor_id, d.doctor_name;

-- case 2
select vt.sample_result,
case when cs.age<20 then 'youth'
when cs.age>=20 and cs.age<35 then 'young'
when cs.age>=35 and cs.age<60 then 'middle'
else 'old'
end as age_range, count(distinct cs.sim_id)
from viral_tests vt join citizen_sims cs  on vt.sim_id=cs.sim_id
group by
vt.sample_result,
case when cs.age<20 then 'youth'
when cs.age>=20 and cs.age<35 then 'young'
when cs.age>=35 and cs.age<60 then 'middle'
else 'old'
end;

-- case 3
select hsptal_id,hsptal_name
from hospitals
where hsptal_id not in (select distinct hsptal_id from viral_tests);

-- case 4
select citizen_name, age, sex
from citizen_sims
where sim_id not in (select distinct sim_id from sim_conn_bs);
-- case 5
select d.district_name
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
where vt.sample_result='positive'
group by d.district_name
order by count(vt.test_id) desc limit 1;

-- case 6

select cs.citizen_name
from citizen_sims cs
join viral_tests vt on cs.sim_id=vt.sim_id
group by cs.citizen_name
order by count(vt.test_id) desc limit 1;
-- case 7

select *
from
(
select
t1.sim_id, t1.doctor, t1.report_time,
(
select t2.report_time
from viral_tests t2
where t1.sim_id=t2.sim_id and t1.doctor=t2.doctor and t1.test_id!=t2.test_id and t1.report_time<t2.report_time
) as again_report_time
from viral_tests t1
) t where again_report_time is not null;
-- case 8
select cs.citizen_name
from citizen_sims cs join viral_tests vt on vt.sim_id=cs.sim_id
where vt.sample_result='negative' and cs.sim_id in (select distinct sim_id from viral_tests where sample_result='positive')
group by cs.citizen_name
having count(vt.test_id)>=2;

-- case 9
select cs.sim_id,month(vt.report_time) as test_month, count(vt.test_id) as test_times
from viral_tests vt join citizen_sims cs on cs.sim_id=vt.sim_id
join sim_conn_bs scb on scb.sim_id=cs.sim_id
where year(vt.report_time)=2021
group by cs.sim_id, month(vt.report_time)
having count(vt.test_id)>=2;


-- case 10
select cs.sex, vt.sample_result, count(distinct cs.sim_id)
from viral_tests vt join citizen_sims cs on vt.sim_id=cs.sim_id
group by cs.sex, vt.sample_result;