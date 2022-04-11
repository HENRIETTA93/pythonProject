
drop table if exists cds;
drop table if exists songs;

CREATE TABLE cds1(
      cd_id text primary key not null,
      title text NOT NULL,
      artist text NOT NULL,
      producer text default NULL,
      year integer,
      contributer text
      );
CREATE TABLE songs1(
      song_id integer primary key not null,
      title text NOT NULL,
      composer text NOT NULL,
      cd_id text NOT NULL,
      track integer NOT NULL,
      contributer text
      );

.read myTunes_Abdelghny.sql
insert into cds1 select * from  cds where cd_id not in (select cd_id from cds1);
insert into songs1 select* from songs where song_id not in(select song_id from songs1);
drop table if exists cds;
drop table if exists songs;

.read myTunes_Ali.sql
insert into cds1 select * from  cds where cd_id not in (select cd_id from cds1);
insert into songs1 select* from songs where song_id not in(select song_id from songs1);
drop table if exists cds;
drop table if exists songs;

.read myTunes_Fatemeh.sql
insert into cds1 select * from  cds where cd_id not in (select cd_id from cds1);
insert into songs1 select* from songs where song_id not in(select song_id from songs1);
drop table if exists cds;
drop table if exists songs;


.read myTunes_Monica.sql
insert into cds1 select * from  cds where cd_id not in (select cd_id from cds1);
insert into songs1 select* from songs where song_id not in(select song_id from songs1);
drop table if exists cds;
drop table if exists songs;


.read myTunes_Rezieh.sql
insert into cds1 select * from  cds where cd_id not in (select cd_id from cds1);
insert into songs1 select* from songs where song_id not in(select song_id from songs1);
drop table if exists cds;
drop table if exists songs;


.read myTunes_Saman.sql
insert into cds1 select * from  cds where cd_id not in (select cd_id from cds1);
insert into songs1 select* from songs where song_id not in(select song_id from songs1);
drop table if exists cds;
drop table if exists songs;

create table cds as select * from cds1;
create table songs as select * from songs1;

drop table if exists cds1;
drop table if exists songs1;
