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



