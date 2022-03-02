create database ParcInfo;
use ParcInfo;

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
