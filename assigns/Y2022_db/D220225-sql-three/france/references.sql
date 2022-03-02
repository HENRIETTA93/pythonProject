-- 4
alter table Poste add constraint fk_poste_indip foreign key (indIP) references Segment(indIP);

alter table Poste add constraint fk_poste_typeposte foreign key (typePoste) references Types(typeLP);

alter table Poste add constraint fk_poste_nsalle foreign key(nSalle) references Salle(nSalle);

alter table Installer add constraint fk_installer_nposte foreign key (nPoste) references Poste(nPoste);

alter table Installer add constraint fk_installer_nlog foreign key (nLog) references Logiciel(nLog);

alter table Salle add constraint fk_salle_indip foreign key (indIP) references Segment(indIP);

-- 5
-- 1452 - Cannot add or update a child row: a foreign key constraint fails (`yale`.`#sql-16bc_6`, CONSTRAINT `fk_salle_indip` FOREIGN KEY (`indIP`) REFERENCES `segment` (`indIP`))
-- 6
delete from Salle where indIP='130.120.83';
alter table Salle add constraint fk_salle_indip foreign key (indIP) references Segment(indIP);