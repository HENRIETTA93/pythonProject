drop table Division cascade constraints;
drop table Event cascade constraints;
drop table Racement cascade constraints;
drop table Swimmer cascade constraints;
drop table Competition cascade constraints;
drop table Officials cascade constraints;
drop table OfficialRace cascade constraints;

create table Division(
divisionID varchar2(15),
age number(3) not null,
gender varchar2(10) not null,
coach varchar2(20),
constraint division_pk primary key (DivisionID)
);

create table Event(
eventID varchar2(15),
eventType varchar2(30) not null,
constraint event_pk primary key (eventID)
);

create table Racement(
raceID number(5),
eventID varchar2(15),
divisionID varchar2(15),
raceNumber varchar2(10),
raceWeek varchar2(20),
raceTime varchar2(20),
constraint racement_pk primary key (raceID),
constraint racement_eventid_fk foreign key (eventID) references Event(eventID),
constraint racement_divisionid_fk foreign key (divisionID) references Division(divisionID)
);

create table Swimmer(
swimmerID varchar2(15),
swimmerName varchar2(30),
age number(3),
gender varchar2(10),
divisionID varchar2(15),
constraint swimmer_pk  primary key(swimmerID),
constraint swimmer_divisionid_fk foreign key (divisionID) references Division(divisionID)
);

create table Competition(
swimmerID varchar2(15),
raceID number(5),
laneNumber number(1),
swamTime number(3),
result varchar2(20),
point number(1),
constraint competition_pk primary key (swimmerID, raceID),
constraint competition_swimmerid_fk foreign key (swimmerID) references Swimmer(swimmerID),
constraint competition_raceid_fk foreign key (raceID) references Racement(raceID)
);

create table Officials(
officialID number(5),
officialName varchar2(20),
constraint officials_pk primary key (officialID)
);

create table OfficialRace(
raceID number(5),
officialID number(5),
officialRole varchar2(20),
constraint officialrace_pk primary key (raceID, officialID),
constraint officialrace_raceid_fk foreign key (raceID) references Racement(raceID),
constraint officialrace_officialid_fk foreign key (officialID) references Officials(officialID)
);



-- insert into division

insert into Division(divisionID,age, gender, coach)
values ('Division 1',13, 'boys','coach 1');
insert into Division(divisionID,age, gender, coach)
values ('Division 2',13, 'girls','coach 2');
insert into Division(divisionID,age, gender, coach)
values ('Division 3',14, 'boys','coach 3');
insert into Division(divisionID,age, gender, coach)
values ('Division 4',14, 'girls','coach 4');
insert into Division(divisionID,age, gender, coach)
values ('Division 5',15, 'boys','coach 5');
insert into Division(divisionID,age, gender, coach)
values ('Division 6',15, 'girls','coach 6');
insert into Division(divisionID,age, gender, coach)
values ('Division 7',16, 'boys','coach 7');
insert into Division(divisionID,age, gender, coach)
values ('Division 8',16, 'girls','coach 8');

-- insert into event

insert into Event (eventID, eventType)
values ('Event 1', '50 metres Freestyle');
insert into Event (eventID, eventType)
values ('Event 2', '50 metres Breaststroke');
insert into Event (eventID, eventType)
values ('Event 3', '50 metres Butterfly');
insert into Event (eventID, eventType)
values ('Event 4', '50 metres Backstroke');
insert into Event (eventID, eventType)
values ('Event 5', '4 x 50 metres Medley');


-- insert into racement

insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (1, 'Event 1', 'Division 1', 'Race 1','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (2, 'Event 1', 'Division 2', 'Race 2','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (3, 'Event 1', 'Division 3', 'Race 3','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (4, 'Event 1', 'Division 4', 'Race 4','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (5, 'Event 1', 'Division 5', 'Race 5','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (6, 'Event 1', 'Division 6', 'Race 6','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (7, 'Event 1', 'Division 7', 'Race 7','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (8, 'Event 1', 'Division 8', 'Race 8','racemeet 1','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (9, 'Event 2', 'Division 1', 'Race 1','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (10, 'Event 2', 'Division 2', 'Race 2','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (11, 'Event 2', 'Division 3', 'Race 3','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (12, 'Event 2', 'Division 4', 'Race 4','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (13, 'Event 2', 'Division 5', 'Race 5','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (14, 'Event 2', 'Division 6', 'Race 6','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (15, 'Event 2', 'Division 7', 'Race 7','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (16, 'Event 2', 'Division 8', 'Race 8','racemeet 1','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (17, 'Event 3', 'Division 1', 'Race 1','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (18, 'Event 3', 'Division 2', 'Race 2','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (19, 'Event 3', 'Division 3', 'Race 3','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (20, 'Event 3', 'Division 4', 'Race 4','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (21, 'Event 3', 'Division 5', 'Race 5','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (22, 'Event 3', 'Division 6', 'Race 6','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (23, 'Event 3', 'Division 7', 'Race 7','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (24, 'Event 3', 'Division 8', 'Race 8','racemeet 1','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (25, 'Event 4', 'Division 1', 'Race 1','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (26, 'Event 4', 'Division 2', 'Race 2','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (27, 'Event 4', 'Division 3', 'Race 3','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (28, 'Event 4', 'Division 4', 'Race 4','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (29, 'Event 4', 'Division 5', 'Race 5','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (30, 'Event 4', 'Division 6', 'Race 6','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (31, 'Event 4', 'Division 7', 'Race 7','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (32, 'Event 4', 'Division 8', 'Race 8','racemeet 1','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (33, 'Event 5', 'Division 1', 'Race 1','racemeet 1','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (34, 'Event 5', 'Division 2', 'Race 2','racemeet 1','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (35, 'Event 5', 'Division 3', 'Race 3','racemeet 1','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (36, 'Event 5', 'Division 4', 'Race 4','racemeet 1','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (37, 'Event 5', 'Division 5', 'Race 5','racemeet 1','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (38, 'Event 5', 'Division 6', 'Race 6','racemeet 1','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (39, 'Event 5', 'Division 7', 'Race 7','racemeet 1','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (40, 'Event 5', 'Division 8', 'Race 8','racemeet 1','8:00pm - 9:00pm');

insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (41, 'Event 1', 'Division 1', 'Race 1','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (42, 'Event 1', 'Division 2', 'Race 2','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (43, 'Event 1', 'Division 3', 'Race 3','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (44, 'Event 1', 'Division 4', 'Race 4','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (45, 'Event 1', 'Division 5', 'Race 5','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (46, 'Event 1', 'Division 6', 'Race 6','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (47, 'Event 1', 'Division 7', 'Race 7','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (48, 'Event 1', 'Division 8', 'Race 8','racemeet 2','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (49, 'Event 2', 'Division 1', 'Race 1','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (50, 'Event 2', 'Division 2', 'Race 2','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (51, 'Event 2', 'Division 3', 'Race 3','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (52, 'Event 2', 'Division 4', 'Race 4','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (53, 'Event 2', 'Division 5', 'Race 5','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (54, 'Event 2', 'Division 6', 'Race 6','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (55, 'Event 2', 'Division 7', 'Race 7','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (56, 'Event 2', 'Division 8', 'Race 8','racemeet 2','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (57, 'Event 3', 'Division 1', 'Race 1','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (58, 'Event 3', 'Division 2', 'Race 2','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (59, 'Event 3', 'Division 3', 'Race 3','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (60, 'Event 3', 'Division 4', 'Race 4','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (61, 'Event 3', 'Division 5', 'Race 5','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (62, 'Event 3', 'Division 6', 'Race 6','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (63, 'Event 3', 'Division 7', 'Race 7','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (64, 'Event 3', 'Division 8', 'Race 8','racemeet 2','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (65, 'Event 4', 'Division 1', 'Race 1','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (66, 'Event 4', 'Division 2', 'Race 2','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (67, 'Event 4', 'Division 3', 'Race 3','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (68, 'Event 4', 'Division 4', 'Race 4','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (69, 'Event 4', 'Division 5', 'Race 5','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (70, 'Event 4', 'Division 6', 'Race 6','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (71, 'Event 4', 'Division 7', 'Race 7','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (72, 'Event 4', 'Division 8', 'Race 8','racemeet 2','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (73, 'Event 5', 'Division 1', 'Race 1','racemeet 2','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (74, 'Event 5', 'Division 2', 'Race 2','racemeet 2','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (75, 'Event 5', 'Division 3', 'Race 3','racemeet 2','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (76, 'Event 5', 'Division 4', 'Race 4','racemeet 2','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (77, 'Event 5', 'Division 5', 'Race 5','racemeet 2','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (78, 'Event 5', 'Division 6', 'Race 6','racemeet 2','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (79, 'Event 5', 'Division 7', 'Race 7','racemeet 2','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (80, 'Event 5', 'Division 8', 'Race 8','racemeet 2','8:00pm - 9:00pm');

insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (81 , 'Event 1', 'Division 1', 'Race 1','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (82 , 'Event 1', 'Division 2', 'Race 2','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (83 , 'Event 1', 'Division 3', 'Race 3','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (84 , 'Event 1', 'Division 4', 'Race 4','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (85 , 'Event 1', 'Division 5', 'Race 5','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (86 , 'Event 1', 'Division 6', 'Race 6','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (87 , 'Event 1', 'Division 7', 'Race 7','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (88 , 'Event 1', 'Division 8', 'Race 8','racemeet 3','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (89 , 'Event 2', 'Division 1', 'Race 1','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (90 , 'Event 2', 'Division 2', 'Race 2','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (91 , 'Event 2', 'Division 3', 'Race 3','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (92 , 'Event 2', 'Division 4', 'Race 4','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (93 , 'Event 2', 'Division 5', 'Race 5','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (94 , 'Event 2', 'Division 6', 'Race 6','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (95 , 'Event 2', 'Division 7', 'Race 7','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (96 , 'Event 2', 'Division 8', 'Race 8','racemeet 3','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (97 , 'Event 3', 'Division 1', 'Race 1','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (98 , 'Event 3', 'Division 2', 'Race 2','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (99 , 'Event 3', 'Division 3', 'Race 3','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (100 , 'Event 3', 'Division 4', 'Race 4','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (101 , 'Event 3', 'Division 5', 'Race 5','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (102 , 'Event 3', 'Division 6', 'Race 6','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (103 , 'Event 3', 'Division 7', 'Race 7','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (104 , 'Event 3', 'Division 8', 'Race 8','racemeet 3','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (105 , 'Event 4', 'Division 1', 'Race 1','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (106 , 'Event 4', 'Division 2', 'Race 2','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (107 , 'Event 4', 'Division 3', 'Race 3','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (108 , 'Event 4', 'Division 4', 'Race 4','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (109 , 'Event 4', 'Division 5', 'Race 5','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (110 , 'Event 4', 'Division 6', 'Race 6','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (111 , 'Event 4', 'Division 7', 'Race 7','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (112 , 'Event 4', 'Division 8', 'Race 8','racemeet 3','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (113 , 'Event 5', 'Division 1', 'Race 1','racemeet 3','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (114 , 'Event 5', 'Division 2', 'Race 2','racemeet 3','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (115 , 'Event 5', 'Division 3', 'Race 3','racemeet 3','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (116 , 'Event 5', 'Division 4', 'Race 4','racemeet 3','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (117 , 'Event 5', 'Division 5', 'Race 5','racemeet 3','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (118 , 'Event 5', 'Division 6', 'Race 6','racemeet 3','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (119 , 'Event 5', 'Division 7', 'Race 7','racemeet 3','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (120 , 'Event 5', 'Division 8', 'Race 8','racemeet 3','8:00pm - 9:00pm');

insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (121, 'Event 1', 'Division 1', 'Race 1','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (122, 'Event 1', 'Division 2', 'Race 2','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (123, 'Event 1', 'Division 3', 'Race 3','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (124, 'Event 1', 'Division 4', 'Race 4','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (125, 'Event 1', 'Division 5', 'Race 5','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (126, 'Event 1', 'Division 6', 'Race 6','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (127, 'Event 1', 'Division 7', 'Race 7','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (128, 'Event 1', 'Division 8', 'Race 8','racemeet 4','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (129, 'Event 2', 'Division 1', 'Race 1','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (130, 'Event 2', 'Division 2', 'Race 2','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (131, 'Event 2', 'Division 3', 'Race 3','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (132, 'Event 2', 'Division 4', 'Race 4','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (133, 'Event 2', 'Division 5', 'Race 5','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (134, 'Event 2', 'Division 6', 'Race 6','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (135, 'Event 2', 'Division 7', 'Race 7','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (136, 'Event 2', 'Division 8', 'Race 8','racemeet 4','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (137, 'Event 3', 'Division 1', 'Race 1','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (138, 'Event 3', 'Division 2', 'Race 2','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (139, 'Event 3', 'Division 3', 'Race 3','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (140, 'Event 3', 'Division 4', 'Race 4','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (141, 'Event 3', 'Division 5', 'Race 5','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (142, 'Event 3', 'Division 6', 'Race 6','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (143, 'Event 3', 'Division 7', 'Race 7','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (144, 'Event 3', 'Division 8', 'Race 8','racemeet 4','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (145, 'Event 4', 'Division 1', 'Race 1','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (146, 'Event 4', 'Division 2', 'Race 2','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (147, 'Event 4', 'Division 3', 'Race 3','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (148, 'Event 4', 'Division 4', 'Race 4','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (149, 'Event 4', 'Division 5', 'Race 5','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (150, 'Event 4', 'Division 6', 'Race 6','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (151, 'Event 4', 'Division 7', 'Race 7','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (152, 'Event 4', 'Division 8', 'Race 8','racemeet 4','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (153, 'Event 5', 'Division 1', 'Race 1','racemeet 4','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (154, 'Event 5', 'Division 2', 'Race 2','racemeet 4','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (155, 'Event 5', 'Division 3', 'Race 3','racemeet 4','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (156, 'Event 5', 'Division 4', 'Race 4','racemeet 4','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (157, 'Event 5', 'Division 5', 'Race 5','racemeet 4','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (158, 'Event 5', 'Division 6', 'Race 6','racemeet 4','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (159, 'Event 5', 'Division 7', 'Race 7','racemeet 4','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (160, 'Event 5', 'Division 8', 'Race 8','racemeet 4','8:00pm - 9:00pm');

insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (161, 'Event 1', 'Division 1', 'Race 1','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (162, 'Event 1', 'Division 2', 'Race 2','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (163, 'Event 1', 'Division 3', 'Race 3','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (164, 'Event 1', 'Division 4', 'Race 4','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (165, 'Event 1', 'Division 5', 'Race 5','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (166, 'Event 1', 'Division 6', 'Race 6','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (167, 'Event 1', 'Division 7', 'Race 7','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (168, 'Event 1', 'Division 8', 'Race 8','racemeet 5','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (169, 'Event 2', 'Division 1', 'Race 1','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (170, 'Event 2', 'Division 2', 'Race 2','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (171, 'Event 2', 'Division 3', 'Race 3','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (172, 'Event 2', 'Division 4', 'Race 4','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (173, 'Event 2', 'Division 5', 'Race 5','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (174, 'Event 2', 'Division 6', 'Race 6','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (175, 'Event 2', 'Division 7', 'Race 7','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (176, 'Event 2', 'Division 8', 'Race 8','racemeet 5','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (177, 'Event 3', 'Division 1', 'Race 1','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (178, 'Event 3', 'Division 2', 'Race 2','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (179, 'Event 3', 'Division 3', 'Race 3','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (180, 'Event 3', 'Division 4', 'Race 4','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (181, 'Event 3', 'Division 5', 'Race 5','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (182, 'Event 3', 'Division 6', 'Race 6','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (183, 'Event 3', 'Division 7', 'Race 7','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (184, 'Event 3', 'Division 8', 'Race 8','racemeet 5','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (185, 'Event 4', 'Division 1', 'Race 1','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (186, 'Event 4', 'Division 2', 'Race 2','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (187, 'Event 4', 'Division 3', 'Race 3','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (188, 'Event 4', 'Division 4', 'Race 4','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (189, 'Event 4', 'Division 5', 'Race 5','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (190, 'Event 4', 'Division 6', 'Race 6','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (191, 'Event 4', 'Division 7', 'Race 7','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (192, 'Event 4', 'Division 8', 'Race 8','racemeet 5','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (193, 'Event 5', 'Division 1', 'Race 1','racemeet 5','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (194, 'Event 5', 'Division 2', 'Race 2','racemeet 5','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (195, 'Event 5', 'Division 3', 'Race 3','racemeet 5','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (196, 'Event 5', 'Division 4', 'Race 4','racemeet 5','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (197, 'Event 5', 'Division 5', 'Race 5','racemeet 5','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (198, 'Event 5', 'Division 6', 'Race 6','racemeet 5','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (199, 'Event 5', 'Division 7', 'Race 7','racemeet 5','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (200, 'Event 5', 'Division 8', 'Race 8','racemeet 5','8:00pm - 9:00pm');

insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (201, 'Event 1', 'Division 1', 'Race 1','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (202, 'Event 1', 'Division 2', 'Race 2','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (203, 'Event 1', 'Division 3', 'Race 3','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (204, 'Event 1', 'Division 4', 'Race 4','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (205, 'Event 1', 'Division 5', 'Race 5','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (206, 'Event 1', 'Division 6', 'Race 6','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (207, 'Event 1', 'Division 7', 'Race 7','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (208, 'Event 1', 'Division 8', 'Race 8','racemeet 6','5:30 - 6:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (209, 'Event 2', 'Division 1', 'Race 1','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (210, 'Event 2', 'Division 2', 'Race 2','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (211, 'Event 2', 'Division 3', 'Race 3','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (212, 'Event 2', 'Division 4', 'Race 4','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (213, 'Event 2', 'Division 5', 'Race 5','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (214, 'Event 2', 'Division 6', 'Race 6','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (215, 'Event 2', 'Division 7', 'Race 7','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (216, 'Event 2', 'Division 8', 'Race 8','racemeet 6','6:00pm - 6:45pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (217, 'Event 3', 'Division 1', 'Race 1','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (218, 'Event 3', 'Division 2', 'Race 2','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (219, 'Event 3', 'Division 3', 'Race 3','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (220, 'Event 3', 'Division 4', 'Race 4','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (221, 'Event 3', 'Division 5', 'Race 5','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (222, 'Event 3', 'Division 6', 'Race 6','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (223, 'Event 3', 'Division 7', 'Race 7','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (224, 'Event 3', 'Division 8', 'Race 8','racemeet 6','6:45pm - 7:15pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (225, 'Event 4', 'Division 1', 'Race 1','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (226, 'Event 4', 'Division 2', 'Race 2','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (227, 'Event 4', 'Division 3', 'Race 3','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (228, 'Event 4', 'Division 4', 'Race 4','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (229, 'Event 4', 'Division 5', 'Race 5','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (230, 'Event 4', 'Division 6', 'Race 6','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (231, 'Event 4', 'Division 7', 'Race 7','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (232, 'Event 4', 'Division 8', 'Race 8','racemeet 6','7:20pm - 7:50pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (233, 'Event 5', 'Division 1', 'Race 1','racemeet 6','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (234, 'Event 5', 'Division 2', 'Race 2','racemeet 6','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (235, 'Event 5', 'Division 3', 'Race 3','racemeet 6','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (236, 'Event 5', 'Division 4', 'Race 4','racemeet 6','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (237, 'Event 5', 'Division 5', 'Race 5','racemeet 6','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (238, 'Event 5', 'Division 6', 'Race 6','racemeet 6','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (239, 'Event 5', 'Division 7', 'Race 7','racemeet 6','8:00pm - 9:00pm');
insert into Racement (raceID, eventID, divisionID, raceNumber, raceWeek, raceTime) values (240, 'Event 5', 'Division 8', 'Race 8','racemeet 6','8:00pm - 9:00pm');





-- insert into swimmer
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 1','swimmer 1', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 2','swimmer 2', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 3','swimmer 3', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 4','swimmer 4', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 5','swimmer 5', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 6','swimmer 6', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 7','swimmer 7', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 8','swimmer 8', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 9','swimmer 9', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 10','swimmer 10', 13,'boy', 'Division 1');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 11','swimmer 11', 13,'boy', 'Division 1');

insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 12','swimmer 12', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 13','swimmer 13', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 14','swimmer 14', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 15','swimmer 15', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 16','swimmer 16', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 17','swimmer 17', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 18','swimmer 18', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 19','swimmer 19', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 20','swimmer 20', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 21','swimmer 21', 13,'girl', 'Division 2');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 22','swimmer 22', 13,'girl', 'Division 2');

insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 23','swimmer 23', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 24','swimmer 24', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 25','swimmer 25', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 26','swimmer 26', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 27','swimmer 27', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 28','swimmer 28', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 29','swimmer 29', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 30','swimmer 30', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 31','swimmer 31', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 32','swimmer 32', 14,'boy', 'Division 3');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 33','swimmer 33', 14,'boy', 'Division 3');

insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 34','swimmer 34', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 35','swimmer 35', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 36','swimmer 36', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 37','swimmer 37', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 38','swimmer 38', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 39','swimmer 39', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 40','swimmer 40', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 41','swimmer 41', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 42','swimmer 42', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 43','swimmer 43', 14,'girl', 'Division 4');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 44','swimmer 44', 14,'girl', 'Division 4');

insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 45','swimmer 45', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 46','swimmer 46', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 47','swimmer 47', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 48','swimmer 48', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 49','swimmer 49', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 50','swimmer 50', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 51','swimmer 51', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 52','swimmer 52', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 53','swimmer 53', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 54','swimmer 54', 15,'boy', 'Division 5');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 55','swimmer 55', 15,'boy', 'Division 5');

insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 56','swimmer 56', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 57','swimmer 57', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 58','swimmer 58', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 59','swimmer 59', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 60','swimmer 60', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 61','swimmer 61', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 62','swimmer 62', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 63','swimmer 63', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 64','swimmer 64', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 65','swimmer 65', 15,'girl', 'Division 6');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 66','swimmer 66', 15,'girl', 'Division 6');

insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 67','swimmer 67', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 68','swimmer 68', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 69','swimmer 69', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 70','swimmer 70', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 71','swimmer 71', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 72','swimmer 72', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 73','swimmer 73', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 74','swimmer 74', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 75','swimmer 75', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 76','swimmer 76', 16,'boy', 'Division 7');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 77','swimmer 77', 16,'boy', 'Division 7');

insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 78','swimmer 78', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 79','swimmer 79', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 80','swimmer 80', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 81','swimmer 81', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 82','swimmer 82', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 83','swimmer 83', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 84','swimmer 84', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 85','swimmer 85', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 86','swimmer 86', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 87','swimmer 87', 16,'girl', 'Division 8');
insert into Swimmer (swimmerID, swimmerName, age, gender, divisionID) values ('swimmer 88','swimmer 88', 16,'girl', 'Division 8');

-- insert into competition
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 1,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 1,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 1,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 1,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 1,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 1,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 1,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 10', 1,43,8,'8th place', 1);

insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 2,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 2,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 2,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 2,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 2,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 2,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 2,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 10', 2,43,8,'8th place', 1);


insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 12', 2,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 13', 2,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 14', 2,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 15', 2,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 16', 2,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 18', 2,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 19', 2,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 21', 2,43,8,'8th place', 1);


insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 24', 3,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 23', 3,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 28', 3,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 25', 3,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 26', 3,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 30', 3,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 29', 3,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 31', 3,43,8,'8th place', 1);

insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 41,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 41,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 41,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 41,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 41,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 41,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 41,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 10', 41,43,8,'8th place', 1);


insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 155,12,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 155,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 155,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 155,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 155,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 155,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 155,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 11', 155,43,8,'8th place', 1);


insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 89,14,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 89,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 89,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 89,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 89,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 89,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 89,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 11', 89,43,8,'8th place', 1);

insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 97,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 97,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 97,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 97,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 97,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 97,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 97,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 11', 97,43,8,'8th place', 1);

insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 105,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 105,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 105,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 105,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 105,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 105,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 105,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 11', 105,43,8,'8th place', 1);

insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 1', 233,15,1,'1st place', 8);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 3', 233,20,2,'2nd place', 7);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 4', 233,25,3,'3rd place', 6);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 2', 233,30,4,'4th place', 5);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 7', 233,34,5,'5th place', 4);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 8', 233,40,6,'6th place', 3);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 9', 233,42,7,'7th place', 2);
insert into Competition (swimmerID, raceID, swamTime, laneNumber, result,point) values ('swimmer 11', 233,43,8,'8th place', 1);



insert into Officials(officialID, officialName) values(1,'official 1');
insert into Officials(officialID, officialName) values(2,'official 2');
insert into Officials(officialID, officialName) values(3,'official 3');
insert into Officials(officialID, officialName) values(4,'official 4');
insert into Officials(officialID, officialName) values(5,'official 5');
insert into Officials(officialID, officialName) values(6,'official 6');
insert into Officials(officialID, officialName) values(7,'official 7');


insert into OfficialRace(raceID,officialID, officialRole) values(1,1,'Starter');
insert into OfficialRace(raceID,officialID, officialRole) values(1,2,'Scrutineer');
insert into OfficialRace(raceID,officialID, officialRole) values(1,3,'Scrutineer');
insert into OfficialRace(raceID,officialID, officialRole) values(1,4,'Admin');
insert into OfficialRace(raceID,officialID, officialRole) values(1,5,'Admin');
insert into OfficialRace(raceID,officialID, officialRole) values(1,6,'Results');
insert into OfficialRace(raceID,officialID, officialRole) values(1,7,'Results');

commit;