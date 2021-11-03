--
-- COMP3311 21T3 Assignment 2 ... MyMyUNSW Schema
--

-- Useful data types

CREATE DOMAIN ShortName AS varchar(16);
CREATE DOMAIN MediumName AS varchar(64);
CREATE DOMAIN LongName AS varchar(128);
CREATE DOMAIN ShortString AS varchar(16);

CREATE DOMAIN UrlString AS varchar(128) check (value ~ '^https?//');

CREATE TYPE AcadObjGroupDefType AS enum ('enumerated','pattern','query');

CREATE TYPE AcadObjGroupLogicType AS enum ('and','or');

CREATE TYPE AcadObjGroupType AS enum ('subject','stream','program');

CREATE TYPE CareerType AS enum ('UG','PG','HY','RS','NA');

CREATE DOMAIN CourseYearType AS integer check (value > 1945);

CREATE TYPE GradeType AS enum
	('A', 'A+', 'A-', 'AF', 'AS', 'AW', 'B', 'B+', 'B-', 'C', 'C+',
	 'C-', 'CR', 'D', 'D+', 'D-', 'DN', 'E', 'E+', 'E-', 'EC',
	 'EM', 'F', 'FL', 'HD', 'NA', 'NC', 'NF', 'PE', 'PS', 'PW',
	 'RC', 'RD', 'RS', 'SY', 'UF', 'WD', 'WJ', 'XE');

CREATE TYPE TermType AS enum ('X1','S1','S2','T0','T1','T2','T3');

CREATE type RuleType AS enum ('CC','PE','FE','GE','RQ','DS','MR','LR','WM');

CREATE TYPE VariationType AS enum ('advstanding','substitution','exemption');

-- Possibly useful for implementing a transcript(zid) function
CREATE TYPE TranscriptRecord AS (
	code char(8),
	term char(4),
	name text,
	mark integer,
	grade char(2),
	uoc integer
);

-- Tuples from dbpop()
CREATE TYPE PopRecord AS (
	tab_name text,
	n_records integer
);


-- Show database stats
CREATE FUNCTION dbpop() RETURNS SETOF public.poprecord
    LANGUAGE plpgsql
    AS $$
declare
	r record;
	nr integer;
	res PopRecord;
begin
	for r in select tablename
		 from pg_tables
		 where schemaname = 'public'
		 order by tablename
	loop
		execute 'select count(*) from '||quote_ident(r.tablename) into nr;
		res.tab_name := r.tablename; res.n_records := nr;
		return next res;
	end loop;
	return;
end;
$$;


-- Tables that are effectively enumerated types plus more

CREATE TABLE academic_standing (
    id integer primary key,
    standing ShortName not null,
    notes text
);

CREATE TABLE class_types (
    id integer primary key,
    unswid ShortString not null, -- e.g. LEC, TLB, ...
    name MediumName not null,
    description text
);

CREATE TABLE room_types (
    id integer primary key,
    description text not null
);

CREATE TABLE Countries (
    id integer primary key,
    code char(3) not null,
    name LongName not null
);

CREATE TABLE degree_types (
    id integer primary key,
    unswid ShortName not null,
    name text not null,
    prefix text,
    career CareerType,
    aqf_level integer check (aqf_level > 3)
);

CREATE TABLE stream_types (
    id integer primary key,
    career CareerType not null,
    code char(1) not null,
    description ShortString
);

CREATE TABLE orgunit_types (
    id integer primary key,
    name ShortName not null
);

CREATE TABLE Facilities (
    id integer primary key,
    description text not null
);

CREATE TABLE staff_roles (
    id integer primary key,
    name text not null
);

-- Data tables

CREATE TABLE Books (
    id integer primary key,
    isbn varchar(20),
    title text not null,
    authors text not null,
    publisher text not null,
    edition integer,
    pubyear integer not null,
    CONSTRAINT books_pubyear_check CHECK ((pubyear > 1900))
);

CREATE TABLE Buildings (
    id integer primary key,
    unswid ShortString not null,
    name LongName not null,
    gridref char(4)
);

CREATE TABLE Rooms (
    id integer primary key,
    unswid ShortString not null,
    rtype integer not null references room_types(id),
    name ShortName not null,
    fullname LongName,
    building integer references Buildings(id),
    capacity integer,
    CONSTRAINT rooms_capacity_check CHECK ((capacity >= 0))
);

CREATE TABLE People (
    id integer primary key, --zID
    family LongName,
    given LongName not null,
    fullname LongName not null,
    birthday date,
    origin integer references Countries(id)
);

-- simply indicates that a person is also a student
CREATE TABLE Students (
    id integer references People(id),
	primary key (id)
);

-- information about staff
CREATE TABLE Staff (
    id integer references People(id),
    office integer references Rooms(id),
    phone text,
    employed date not null,
    supervisor integer references Staff(id),
	primary key (id)
);

CREATE TABLE OrgUnits (
    id integer primary key,
    utype integer not null,
    name text not null,
    LongName text,
    unswid ShortString
);

CREATE TABLE Terms (
    id integer primary key,
    year CourseYearType not null,
    ttype TermType not null,
	code  char(4) not null,
    name ShortName not null,
    starting date not null,
    ending date not null
);

-- Academic Objects: subjects, streams, programs

CREATE TABLE Subjects (
    id integer primary key,
    code char(8) not null,
    name MediumName not null,
    LongName LongName,
    uoc integer check (uoc >= 0),
    offeredby integer references OrgUnits(id),
    eftsload double precision,
    career CareerType,
    syllabus text
);

CREATE TABLE Streams (
    id integer primary key,
    code char(6) not null,
    name LongName not null,
    offeredby integer references OrgUnits(id),
    stype integer references stream_types(id),
    description text
);

CREATE TABLE Programs (
    id integer primary key,
    code char(4) not null,
    name LongName not null,
    uoc integer,
    offeredby integer,
    career CareerType,
    duration integer,
    description text,
    CONSTRAINT programs_uoc_check CHECK ((uoc >= 0))
);

CREATE TABLE External_subjects (
    id integer primary key,
    extsubj LongName not null,
    institution LongName not null,
    yearoffered CourseYearType,
    equivto integer not null references Subjects(id)
);

-- subject offerings
CREATE TABLE Courses (
    id integer primary key,
    subject integer references Subjects(id),
    term integer references Terms(id),
    homepage UrlString
);


CREATE TABLE Classes (
    id integer primary key,
    course integer not null references Courses(id),
    room integer not null references Rooms(id),
    ctype integer not null,
    dayofwk integer not null check (dayofwk between 0 and 6),
    starttime integer not null check (starttime between 8 and 22),
    endtime integer not null check (endtime between 9 and 23),
    startdate date not null,
    enddate date not null,
    repeats integer
);

CREATE TABLE Academic_object_groups (
    id integer primary key,
    name LongName,
    type AcadObjGroupType not null,
    defby AcadObjGroupDefType not null,
    definition text
);

CREATE TABLE Rules (
    id integer primary key,
    name MediumName,
    type RuleType not null,
    min_req integer check (min_req >= 0),
    max_req integer check (max_req >= 0),
    ao_group integer references Academic_object_groups(id),
    description text
);


-- Enrolment Variations
CREATE TABLE variations (
    student integer references Students(id),
    program integer references Programs(id),
    subject integer references Subjects(id),
    vtype VariationType not null,
    intequiv integer,
    extequiv integer,
    yearpassed CourseYearType,
    mark integer check (mark >= 50),
    approver integer not null references Staff(id),
    approved date not null,
    CONSTRAINT twocases CHECK
	 ((((intequiv IS NULL) AND (extequiv IS not null)) OR
	  ((intequiv IS not null) AND (extequiv IS NULL))))
);


-- Tables representing n:m relationships

CREATE TABLE affiliations (
    staff integer references Staff(id),
    orgunit integer references OrgUnits(id),
    role integer references staff_roles(id),
    isprimary boolean,
    starting date not null,
    ending date,
	primary key (staff,orgunit,role,starting)
);

CREATE TABLE class_enrolments (
    student integer references Students(id),
    class integer references Classes(id),
	primary key (student,class)
);

CREATE TABLE class_enrolment_waitlist (
    student integer references Students(id),
    class integer references Classes(id),
    applied timestamp without time zone not null,
	primary key (student,class)
);

CREATE TABLE class_teachers (
    class integer references Classes(id),
    teacher integer references Staff(id),
	primary key (class,teacher)
);

CREATE TABLE course_books (
    course integer references Courses(id),
    book integer references Books(id),
    bktype varchar(10) not null check (bktype in ('Text','Reference')),
	primary key (course,book)
);

CREATE TABLE course_enrolment_waitlist (
    student integer references Students(id),
    course integer references Courses(id),
    applied timestamp without time zone not null,
	primary key (student,course)
);

CREATE TABLE course_enrolments (
    student integer not null,
    course integer not null,
    mark integer check (mark between 0 and 100),
    grade GradeType,
	primary key (student,course)
);

CREATE TABLE course_staff (
    course integer references Courses(id),
    staff integer references Staff(id),
    role integer not null
);

CREATE TABLE program_enrolments (
    id integer primary key,
    student integer not null references Students(id),
    term integer not null references Terms(id),
    program integer not null references Programs(id),
    wam real,
    standing integer references academic_standing(id),
    advisor integer references Staff(id),
    notes text
);

CREATE TABLE stream_enrolments (
    partof integer not null references program_enrolments(id),
    stream integer not null references Streams(id)
);

CREATE TABLE degrees_awarded (
    student integer not null,
    program integer not null,
    graduated date
);

CREATE TABLE orgunit_groups (
    owner integer references OrgUnits(id),
    member integer references OrgUnits(id),
	primary key (owner,member)
);

CREATE TABLE program_degrees (
    program integer references Programs(id),
    dtype integer references degree_types(id),
    name text not null,
    abbrev text,
	primary key (program,dtype)
);

CREATE TABLE room_facilities (
    room integer not null,
    facility integer not null
);

CREATE TABLE stream_rules (
    stream integer references Streams(id),
    rule integer references Rules(id),
    primary key (stream,rule)
);

CREATE TABLE program_rules (
    program integer references Programs(id),
    rule integer references Rules(id),
	primary key (program,rule)
);

-- Pre-requisites
CREATE TABLE subject_prereqs (
    subject integer not null references Subjects(id),
    career CareerType not null,
    rule integer not null references Rules(id)
);

