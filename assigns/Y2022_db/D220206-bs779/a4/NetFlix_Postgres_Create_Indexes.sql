CREATE INDEX I_MemberName ON Member(MemberFirstName,MemberLastName);
CREATE INDEX I_PersonName ON MoviePerson(PersonFirstName,PersonLastName);
CREATE UNIQUE INDEX I_DVDTitle ON DVD(DVDTitle);
