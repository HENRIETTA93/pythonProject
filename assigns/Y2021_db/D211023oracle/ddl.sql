
-- table INDIV_MEMBER
create table indiv_member(
i_username varchar2(100) not null,
firstname varchar2(50) not null,
lastname varchar2(50) not null,
email varchar2(100) not null,
joindate date not null,
title varchar2(15),
gender varchar2(23) not null,
organization varchar2(100) not null,
website varchar2(100),
country varchar2(32) not null,
year_birth date,
receive_emails_flag char(1) not null,
member_type char(1) not null
);
alter table indiv_member
add constraint indiv_member_pk primary key (i_username);

alter table indiv_member
add constraint indiv_member_email_ak1 unique(email);

alter table indiv_member modify country default 'USA';
alter table indiv_member modify joindate default sysdate;
alter table indiv_member modify title default 'DR.';


-- checks constraint

alter table indiv_member
add constraint indiv_member_type_chk
check (member_type in ('A','S','M', 'O'));

alter table indiv_member
add constraint indiv_member_gender_chk
check (lower(gender)
in ('man','woman','non-binary','prefer to self-describe','prefer not to indicate' ));

-- MEMB_ACADEMIC
create table memb_academic (
a_username varchar2(100) not null,
primary_teach_field varchar2(100) not null,
diss_title varchar2(200),
directory_flag char(3) not null,
agree_code_conduct char(1) not null,
agree_code_research char(1) not null
);

alter table memb_academic
add constraint acad_member_pk primary key (a_username);

alter table memb_academic
add constraint acad_member_fk1
foreign key(a_username) references indiv_member(i_username);

alter table memb_academic modify agree_code_research default 'Y';
alter table memb_academic modify agree_code_conduct default 'Y';


-- checks contraint
alter table memb_academic
add constraint memb_acad_directory_chk
check (upper(directory_flag) in ('YES', 'NO'));




-- CONFERENCE
create table conference (
conf_id number(*,0) not null,
conf_name varchar2(20) not null,
conf_start_date date,
conf_end_date date,
conf_city varchar2(100) not null,
conf_country varchar2(32) not null,
conf_site_name varchar2(100)
);

alter table conference
add constraint conf_pk primary key (conf_id);

alter table conference modify conf_country default 'USA';


-- checks contraint
alter table conference
add constraint conf_end_date_chk
check (conf_end_date>=conf_start_date);


-- CONF_TRACKS
create table conf_tracks (
track_conf_id number(*,0) not null,
track_name varchar2(50) not null,
track_chair varchar2(100) not null,
submission_deadline date not null,
number_submissions number(4),
number_accepted_papers number(2)
);
alter table conf_tracks
add constraint conf_track_pk primary key(track_conf_id, track_name);

alter table conf_tracks
add constraint conf_track_char_fk1
foreign key (track_chair) references memb_academic(a_username);

alter table conf_tracks
add constraint conference_fk1
foreign key (track_conf_id) references conference(conf_id);


--- checks constraint
alter table conf_tracks
add constraint conf_track_accepted_chk1
check (number_accepted_papers<=number_submissions*0.7);

alter table conf_tracks
add constraint conf_track_accepted_chk2
check (number_accepted_papers<=20);