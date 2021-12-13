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

INSERT INTO sim_conn_bs VALUES (1020, 204, '2021-12-05 13:00:00', null);
UPDATE sim_conn_bs SET disconn_time='2021-12-05 13:00:00' WHERE sim_id=1020 AND station_id=204 AND conn_time='2021-12-05 13:00:00';

INSERT INTO sim_conn_bs VALUES (1021, 204, '2021-12-05 14:00:00', null);

UPDATE sim_conn_bs SET disconn_time='2021-12-05 15:00:00' WHERE sim_id=1021 AND station_id=204 AND conn_time='2021-12-05 14:00:00';



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