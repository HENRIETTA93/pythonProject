--Remark :
--All scripts must be wrapped in a transaction (begin transaction; commit;).
--1 – Create a ParcInfo.sql file which contains the SQL code necessary to build the ParcInfo schema without defining the referential constraints (i.e without defining the FOREIGN KEY constraints). (20)
--2 – Modify the domain of the following columns: indIP, nSalle, nLog, nPoste: Character string, and remove the not null constraint from the dateIns column. Name the file: question2.sql (20)
--3 – Run the insertion.sql file to fill in the relationships.
--4 – Add the referential constraints in a references.sql file and execute it. (10)
--5– Explain the error, and display the lines that caused the problem. (The records in the Software and Room relationship causing the problem) (10)
--6- Delete the records that pose a problem and add the reference constraints (Foreign keys). (Add this query to the references.sql file and run it. (30)
--7 – If we added the referential constraints in the ParcInfo.sql file, what is the order of the creation and deletion of the relations. To explain. (10) Referential constraints: 1. Position. #indIP: foreign key to Segment;


drop table if exists Poste;
drop table if exists Salle;
drop table if exists Installer;
drop table if exists Logiciel;
drop table if exists Types;
drop table if exists Segment;

create table Segment(
indIP int primary key,
nomSegment varchar(20),
etage int
);

create table Salle(
nSalle int primary key,
nomSalle varchar(20),
nbPoste int,
indIP int
);


create table Poste(
nPoste int primary key,
nomPoste varchar(20),
indIP int,
ad char(2),
typePoste varchar(20),
nSalle int
);

create table Logiciel(
nLog int primary key,
nomLog varchar(20),
dateAch date,
version varchar(10),
typeLog varchar(20),
prix real
);

create table Installer(
numIns int primary key auto_increment,
nPoste int,
nLog varchar(5),
dateIns timestamp not null,
delai int
);

create table Types(
typeLP varchar(20) primary key,
nomType varchar(30)
);


-- 2.
alter table Segment modify indIP varchar(20);
alter table Salle modify indIP varchar(20);
alter table Poste modify indIP varchar(20);

alter table Salle modify nSalle varchar(5);
alter table Poste modify nSalle varchar(5);

alter table Poste modify nPoste varchar(5);
alter table Installer modify nPoste varchar(5);
alter table Logiciel modify nLog varchar(5);

alter table Installer modify dateIns timestamp null;




-- 3

begin transaction;
INSERT INTO Segment VALUES ('130.120.80','Brin RDC',NULL);
INSERT INTO Segment VALUES ('130.120.81','Brin 1er  etage',NULL);
INSERT INTO Segment VALUES ('130.120.82','Brin 2eme etage',NULL);

INSERT INTO Salle VALUES ('s01','Salle 1',3,'130.120.80');
INSERT INTO Salle VALUES ('s02','Salle 2',2,'130.120.80');
INSERT INTO Salle VALUES ('s03','Salle 3',2,'130.120.80');
INSERT INTO Salle VALUES ('s11','Salle 11',2,'130.120.81');
INSERT INTO Salle VALUES ('s12','Salle 12',1,'130.120.81');
INSERT INTO Salle VALUES ('s21','Salle 21',2,'130.120.82');
INSERT INTO Salle VALUES ('s22','Salle 22',0,'130.120.83');
INSERT INTO Salle VALUES ('s23','Salle 23',0,'130.120.83');

INSERT INTO poste VALUES ('p1','Poste 1','130.120.80','01','TX','s01');
INSERT INTO poste VALUES ('p2','Poste 2','130.120.80','02','UNIX','s01');
INSERT INTO poste VALUES ('p3','Poste 3','130.120.80','03','TX','s01');
INSERT INTO poste VALUES ('p4','Poste 4','130.120.80','04','PCWS','s02');
INSERT INTO poste VALUES ('p5','Poste 5','130.120.80','05','PCWS','s02');
INSERT INTO poste VALUES ('p6','Poste 6','130.120.80','06','UNIX','s03');
INSERT INTO poste VALUES ('p7','Poste 7','130.120.80','07','TX','s03');
INSERT INTO poste VALUES ('p8','Poste 8','130.120.81','01','UNIX','s11');
INSERT INTO poste VALUES ('p9','Poste 9','130.120.81','02','TX','s11');
INSERT INTO poste VALUES ('p10','Poste 10','130.120.81','03','UNIX','s12');
INSERT INTO poste VALUES ('p11','Poste 11','130.120.82','01','PCNT','s21');
INSERT INTO poste VALUES ('p12','Poste 12','130.120.82','02','PCWS','s21');

INSERT INTO logiciel VALUES ('log1','Oracle 6',   '1995-05-13','6.2','UNIX',3000);
INSERT INTO logiciel VALUES ('log2','Oracle 8',   '1999-09-15','8i','UNIX',5600);
INSERT INTO logiciel VALUES ('log3','SQL Server', '1998-04-12','7','PCNT',3000);
INSERT INTO logiciel VALUES ('log4','Front Page', '1997-06-03','5','PCWS',500);
INSERT INTO logiciel VALUES ('log5','WinDev',     '1997-05-12','5','PCWS',750);
INSERT INTO logiciel VALUES ('log6','SQL*Net',     NULL, '2.0','UNIX',500);
INSERT INTO logiciel VALUES ('log7','I. I. S.',   '2002-04-12','2','PCNT',900);
INSERT INTO logiciel VALUES ('log8','DreamWeaver','2003-09-21','2.0','BeOS',1400);

INSERT INTO Types VALUES ('TX',  'Terminal X-Window');
INSERT INTO Types VALUES ('UNIX','Systeme Unix');
INSERT INTO Types VALUES ('PCNT','PC Windows  NT');
INSERT INTO Types VALUES ('PCWS','PC Windows');
INSERT INTO Types VALUES ('NC',  'Network Computer');

INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p2', 'log1', '2003-05-15',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p2', 'log2', '2003-09-17',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p4', 'log5',  NULL,NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p6', 'log6', '2003-05-20',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p6', 'log1', '2003-05-20',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p8', 'log2', '2003-05-19',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p8', 'log6', '2003-05-20',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p11','log3', '2003-04-20',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p12','log4', '2003-04-20',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p11','log7', '2003-04-20',NULL);
INSERT INTO installer (nPoste,nLog,dateIns,delai) VALUES ('p7', 'log7', '2002-04-01',NULL);

SELECT * FROM Segment;
SELECT * FROM Salle;
SELECT * FROM Poste;
SELECT * FROM Logiciel;
SELECT * FROM Installer;
SELECT * FROM Types;

commit;

-- 4
alter table Poste add constraint fk_poste_indip foreign key (indIP) references Segment(indIP);

alter table Poste add constraint fk_poste_typeposte foreign key (typePoste) references Types(typeLP);

alter table Poste add constraint fk_poste_nsalle foreign key(nSalle) references Salle(nSalle);

alter table Installer add constraint fk_installer_nposte foreign key (nPoste) references Poste(nPoste);

alter table Installer add constraint fk_installer_nlog foreign key (nLog) references Logiciel(nLog);

alter table Salle add constraint fk_salle_indip foreign key (indIP) references Segment(indIP);


-- 5
delete from Salle where indIP='130.120.83';
alter table Salle add constraint fk_salle_indip foreign key (indIP) references Segment(indIP);







=== pgsql
drop table if exists Poste;
drop table if exists Salle;
drop table if exists Installer;
drop table if exists Logiciel;
drop table if exists Types;
drop table if exists Segment;

create table Segment(
indIP int primary key,
nomSegment varchar(20),
etage int
);

create table Salle(
nSalle int primary key,
nomSalle varchar(20),
nbPoste int,
indIP int
);


create table Poste(
nPoste int primary key,
nomPoste varchar(20),
indIP int,
ad char(2),
typePoste varchar(20),
nSalle int
);

create table Logiciel(
nLog int primary key,
nomLog varchar(20),
dateAch date,
version varchar(10),
typeLog varchar(20),
prix real
);

create table Installer(
numIns serial primary key,
nPoste int,
nLog varchar(5),
dateIns timestamp not null,
delai int
);

create table Types(
typeLP varchar(20) primary key,
nomType varchar(30)
);


alter table Segment alter indIP type varchar(20) using indIP:: varchar(20);
alter table Salle alter indIP type varchar(20) using indIP::varchar(20);
alter table Poste alter indIP type varchar(20) using indIP:: varchar(20);



alter table Salle alter nSalle type varchar(5) using nSalle::varchar(5);
alter table Poste alter nSalle type varchar(5) using nSalle::varchar(5);

alter table Poste alter nPoste type varchar(5) using nPoste:: varchar(5);
alter table Installer alter nPoste type varchar(5) using nPoste:: varchar(5);
alter table Logiciel alter nLog type varchar(5) using nLog:: varchar(5);

alter table Installer alter dateIns drop not null;


