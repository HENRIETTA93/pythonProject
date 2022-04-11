
drop table if exists cds;
drop table if exists songs;

CREATE TABLE cds_tmp(
      cd_id text primary key not null, --cd unique id
      title text NOT NULL, --title of CD
      artist text NOT NULL, --artist whose CD it is or "various artists"
      producer text default NULL,
      year integer,
      contributer text --student number who contirbuted the data
      );
CREATE TABLE songs_tmp(
      song_id integer primary key not null, --auto incrementing key
      title text NOT NULL, --title of song
      composer text NOT NULL, --person or persons who wrote the song
      cd_id text NOT NULL, --cd this song appears on
      track integer NOT NULL, --track number of the song
      contributer text --student number who contirbuted the data
      );      
      
.read myTunes_Abdelghny.sql
insert into cds_tmp select * from  cds where cd_id not in (select cd_id from cds_tmp);
insert into songs_tmp select* from songs where song_id not in(select song_id from songs_tmp);
drop table if exists cds;
drop table if exists songs;

.read myTunes_Ali.sql
insert into cds_tmp select * from  cds where cd_id not in (select cd_id from cds_tmp);
insert into songs_tmp select* from songs where song_id not in(select song_id from songs_tmp);
drop table if exists cds;
drop table if exists songs;

.read myTunes_Fatemeh.sql
insert into cds_tmp select * from  cds where cd_id not in (select cd_id from cds_tmp);
insert into songs_tmp select* from songs where song_id not in(select song_id from songs_tmp);
drop table if exists cds;
drop table if exists songs;


.read myTunes_Monica.sql
insert into cds_tmp select * from  cds where cd_id not in (select cd_id from cds_tmp);
insert into songs_tmp select* from songs where song_id not in(select song_id from songs_tmp);
drop table if exists cds;
drop table if exists songs;


.read myTunes_Rezieh.sql
insert into cds_tmp select * from  cds where cd_id not in (select cd_id from cds_tmp);
insert into songs_tmp select* from songs where song_id not in(select song_id from songs_tmp);
drop table if exists cds;
drop table if exists songs;


.read myTunes_Saman.sql
insert into cds_tmp select * from  cds where cd_id not in (select cd_id from cds_tmp);
insert into songs_tmp select* from songs where song_id not in(select song_id from songs_tmp);
drop table if exists cds;
drop table if exists songs;

create table cds as select * from cds_tmp;
create table songs as select * from songs_tmp;

drop table if exists cds_tmp;
drop table if exists songs_tmp;
