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
