-- COMP9311 Assignment 2
--
-- check.sql ... checking functions
--
-- Written by: John Shepherd (on the original version of MyMyUNSW DB)
--

--
-- Helper functions
--

create or replace function
    termname(integer) returns text
as
$$
select substr(year::text,3,2)||lower(sess)
from   Terms
where  id = $1
$$ language sql;

create or replace function
	ass2_table_exists(tname text) returns boolean
as $$
declare
	_check integer := 0;
begin
	select count(*) into _check from pg_class
	where relname=tname and relkind='r';
	return (_check = 1);
end;
$$ language plpgsql;

create or replace function
	ass2_view_exists(tname text) returns boolean
as $$
declare
	_check integer := 0;
begin
	select count(*) into _check from pg_class
	where relname=tname and relkind='v';
	return (_check = 1);
end;
$$ language plpgsql;

create or replace function
	ass2_function_exists(tname text) returns boolean
as $$
declare
	_check integer := 0;
begin
	select count(*) into _check from pg_proc
	where proname=tname;
	return (_check > 0);
end;
$$ language plpgsql;

-- ass2_check_result:
-- * determines appropriate message, based on count of
--   excess and missing tuples in user output vs expected output

create or replace function
	ass2_check_result(nexcess integer, nmissing integer) returns text
as $$
begin
	if (nexcess = 0 and nmissing = 0) then
		return 'correct';
	elsif (nexcess > 0 and nmissing = 0) then
		return 'too many result tuples';
	elsif (nexcess = 0 and nmissing > 0) then
		return 'missing result tuples';
	elsif (nexcess > 0 and nmissing > 0) then
		return 'incorrect result tuples';
	end if;
end;
$$ language plpgsql;

-- ass2_check:
-- * compares output of user view/function against expected output
-- * returns string (text message) containing analysis of results

create or replace function
	ass2_check(_type text, _name text, _res text, _query text) returns text
as $$
declare
	nexcess integer;
	nmissing integer;
	excessQ text;
	missingQ text;
begin
	if (_type = 'view' and not ass2_view_exists(_name)) then
		return 'No '||_name||' view; did it load correctly?';
	elsif (_type = 'function' and not ass2_function_exists(_name)) then
		return 'No '||_name||' function; did it load correctly?';
	elsif (not ass2_table_exists(_res)) then
		return _res||': No expected results!';
	else
		excessQ := 'select count(*) '||
			   'from (('||_query||') except '||
			   '(select * from '||_res||')) as X';
		-- raise notice 'Q: %',excessQ;
		execute excessQ into nexcess;
		missingQ := 'select count(*) '||
			    'from ((select * from '||_res||') '||
			    'except ('||_query||')) as X';
		-- raise notice 'Q: %',missingQ;
		execute missingQ into nmissing;
		return ass2_check_result(nexcess,nmissing);
	end if;
	return '???';
end;
$$ language plpgsql;

-- ass2_rescheck:
-- * compares output of user function against expected result
-- * returns string (text message) containing analysis of results

create or replace function
	ass2_rescheck(_type text, _name text, _res text, _query text) returns text
as $$
declare
	_sql text;
	_chk boolean;
begin
	if (_type = 'function' and not ass2_function_exists(_name)) then
		return 'No '||_name||' function; did it load correctly?';
	elsif (_res is null) then
		_sql := 'select ('||_query||') is null';
		-- raise notice 'SQL: %',_sql;
		execute _sql into _chk;
		-- raise notice 'CHK: %',_chk;
	else
		_sql := 'select ('||_query||') = '||quote_literal(_res);
		-- raise notice 'SQL: %',_sql;
		execute _sql into _chk;
		-- raise notice 'CHK: %',_chk;
	end if;
	if (_chk) then
		return 'correct';
	else
		return 'incorrect result';
	end if;
end;
$$ language plpgsql;

-- check_all:
-- * run all of the checks and return a table of results

drop type if exists TestingResult cascade;
create type TestingResult as (test text, result text);

create or replace function
	check_all() returns setof TestingResult
as $$
declare
	i int;
	testQ text;
	result text;
	out TestingResult;
	tests text[] := array[
				'q1', 'q2', 'q3', 
				'q4', 'q5', 'q6', 'q7a', 'q7b', 'q7c', 'q7d', 'q7e',
				'q7f', 'q8a', 'q8b', 'q8c', 'q8d', 'q8e', 'q8f',
				'q9a', 'q9b', 'q9c', 'q9d', 'q9e', 'q9f'
				];
begin
	for i in array_lower(tests,1) .. array_upper(tests,1)
	loop
		testQ := 'select check_'||tests[i]||'()';
		execute testQ into result;
		out := (tests[i],result);
		return next out;
	end loop;
	return;
end;
$$ language plpgsql;


--
-- Check functions for specific test-cases in Assignment 2
--

create or replace function check_q1() returns text
as $chk$
select ass2_check('view','q1','q1_expected',
                   $$select * from q1$$)
$chk$ language sql;

create or replace function check_q2() returns text
as $chk$
select ass2_check('view','q2','q2_expected',
                   $$select * from q2$$)
$chk$ language sql;

create or replace function check_q3() returns text
as $chk$
select ass2_check('view','q3','q3_expected',
                   $$select * from q3$$)
$chk$ language sql;

create or replace function check_q4() returns text
as $chk$
select ass2_check('view','q4','q4_expected',
                   $$select * from q4$$)
$chk$ language sql;

create or replace function check_q5() returns text
as $chk$
select ass2_check('view','q5','q5_expected',
                   $$select * from q5$$)
$chk$ language sql;

create or replace function check_q6() returns text
as $chk$
select ass2_check('view','q6','q6_expected',
                   $$select * from q6$$)
$chk$ language sql;

create or replace function check_q7a() returns text
as $chk$
select ass2_check('function','q7','q7a_expected',
                   $$select * from q7('radio mic')$$)
$chk$ language sql;

create or replace function check_q7b() returns text
as $chk$
select ass2_check('function','q7','q7b_expected',
                   $$select * from q7('Board')$$)
$chk$ language sql;

create or replace function check_q7c() returns text
as $chk$
select ass2_check('function','q7','q7c_expected',
                   $$select * from q7('whiteboard')$$)
$chk$ language sql;

create or replace function check_q7d() returns text
as $chk$
select ass2_check('function','q7','q7d_expected',
                   $$select * from q7('fan')$$)
$chk$ language sql;

create or replace function check_q7e() returns text
as $chk$
select ass2_check('function','q7','q7e_expected',
                   $$select * from q7('NeTworKeD')$$)
$chk$ language sql;

create or replace function check_q7f() returns text
as $chk$
select ass2_check('function','q7','q7f_expected',
                   $$select * from q7('zebra')$$)
$chk$ language sql;

create or replace function check_q8a() returns text
as $chk$
select ass2_check('function','q8','q8a_expected',
                   $$select q8('2005-01-01')$$)
$chk$ language sql;

create or replace function check_q8b() returns text
as $chk$
select ass2_check('function','q8','q8b_expected',
                   $$select q8('2005-04-01')$$)
$chk$ language sql;

create or replace function check_q8c() returns text
as $chk$
select ass2_check('function','q8','q8c_expected',
                   $$select q8('2005-07-15')$$)
$chk$ language sql;

create or replace function check_q8d() returns text
as $chk$
select ass2_check('function','q8','q8d_expected',
                   $$select q8('2009-02-21')$$)
$chk$ language sql;

create or replace function check_q8e() returns text
as $chk$
select ass2_check('function','q8','q8e_expected',
                   $$select q8('2009-02-22')$$)
$chk$ language sql;

create or replace function check_q8f() returns text
as $chk$
select ass2_check('function','q8','q8f_expected',
                   $$select q8('2012-12-12')$$)
$chk$ language sql;

create or replace function check_q9a() returns text
as $chk$
select ass2_check('function','q9','q9a_expected',
                   $$select * from q9(3169329)$$)
$chk$ language sql;

create or replace function check_q9b() returns text
as $chk$
select ass2_check('function','q9','q9b_expected',
                   $$select * from q9(3270322)$$)
$chk$ language sql;

create or replace function check_q9c() returns text
as $chk$
select ass2_check('function','q9','q9c_expected',
                   $$select * from q9(3221565)$$)
$chk$ language sql;

create or replace function check_q9d() returns text
as $chk$
select ass2_check('function','q9','q9d_expected',
                   $$select * from q9(3270322)$$)
$chk$ language sql;

create or replace function check_q9e() returns text
as $chk$
select ass2_check('function','q9','q9e_expected',
                   $$select * from q9(3118617)$$)
$chk$ language sql;

create or replace function check_q9f() returns text
as $chk$
select ass2_check('function','q9','q9f_expected',
                   $$select * from q9(3122308)$$)
$chk$ language sql;

--
-- Tables of expected results for test cases
--

drop table if exists q1_expected;
create table q1_expected (
    name longname,
    school longname,
    starting date
);

drop table if exists q2_expected;
create table q2_expected (
    status text,
    name longname,
    school longname,
    starting date
);

drop table if exists q3_expected;
create table q3_expected (
    code text,
    year integer,
    sess text,
    name text
);

drop table if exists q4_expected;
create table q4_expected (
    term text,
    percent numeric(4,2)
);

drop table if exists q5_expected;
create table q5_expected (
    term text,
    nstudes bigint,
    fte numeric(6,1)
);

drop table if exists q6_expected;
create table q6_expected (
    subject text,
    nofferings bigint
);

drop table if exists q7a_expected;
create table q7a_expected (
    room text,
    facility text
);

drop table if exists q7b_expected;
create table q7b_expected (
    room text,
    facility text
);

drop table if exists q7c_expected;
create table q7c_expected (
    room text,
    facility text
);

drop table if exists q7d_expected;
create table q7d_expected (
    room text,
    facility text
);

drop table if exists q7e_expected;
create table q7e_expected (
    room text,
    facility text
);

drop table if exists q7f_expected;
create table q7f_expected (
    room text,
    facility text
);

drop table if exists q8a_expected;
create table q8a_expected (
    q8 text
);

drop table if exists q8b_expected;
create table q8b_expected (
    q8 text
);

drop table if exists q8c_expected;
create table q8c_expected (
    q8 text
);

drop table if exists q8d_expected;
create table q8d_expected (
    q8 text
);

drop table if exists q8e_expected;
create table q8e_expected (
    q8 text
);

drop table if exists q8f_expected;
create table q8f_expected (
    q8 text
);

drop table if exists q9a_expected;
create table q9a_expected (
    code character(8),
    term character(4),
    name text,
    mark integer,
    grade character(2),
    uoc integer
);

drop table if exists q9b_expected;
create table q9b_expected (
    code character(8),
    term character(4),
    name text,
    mark integer,
    grade character(2),
    uoc integer
);

drop table if exists q9c_expected;
create table q9c_expected (
    code character(8),
    term character(4),
    name text,
    mark integer,
    grade character(2),
    uoc integer
);

drop table if exists q9d_expected;
create table q9d_expected (
    code character(8),
    term character(4),
    name text,
    mark integer,
    grade character(2),
    uoc integer
);

drop table if exists q9e_expected;
create table q9e_expected (
    code character(8),
    term character(4),
    name text,
    mark integer,
    grade character(2),
    uoc integer
);

drop table if exists q9f_expected;
create table q9f_expected (
    code character(8),
    term character(4),
    name text,
    mark integer,
    grade character(2),
    uoc integer
);

COPY q1_expected (name, school, starting) FROM stdin;
Eliathamby Ambikairajah	Electrical Engineering & Telecommunications	1999-08-25
Anthony Dooley	Mathematics & Statistics	1980-11-03
Christopher Rizos	Surveying and Spatial Information Systems	1984-01-03
Nicholas Hawkins	Medical Sciences	1989-01-09
Ross Harley	Media Arts	1989-02-13
Richard Newbury	Physics	1991-03-01
Chandini MacIntyre	Public Health & Community Medicine	2008-03-26
Sylvia Ross	Art - COFA	1990-01-01
Fiona Stapleton	Optometry and Vision Science	1995-09-25
Margaret McKerchar	Australian School of Taxation (ATAX)	2000-01-28
Anne Simmons	Graduate School of Biomedical Engineering	1999-06-28
Andrew Killcross	Psychology	2001-07-01
Rogelia Pe-Pua	Social Sciences and International Studies	1996-02-12
Brendan Edgeworth	School of Law	1989-02-01
Roger Simnett	Accounting	1987-02-02
Philip Mitchell	Psychiatry	1985-01-07
Michael Chapman	Women's and Children's Health	1994-10-10
Kevin Fox	Economics	1994-07-01
Paul Patterson	Marketing	1996-09-02
Stephen Frenkel	Organisation and Management	1975-07-14
Kim Snepvangers	Art History & Art Education (COFA)	1993-02-02
David Cohen	Biological, Earth and Environmental Sciences	1990-01-29
Bruce Hebblewhite	Mining Engineering	1995-04-01
Richard Corkish	Photovoltaic and Renewable Engineering	1994-04-01
Barbara Messerle	Chemistry	1999-03-01
Liz Williamson	Design Studies - COFA	1997-01-02
Michael Frater	Information Technology and Electrical Engineering (ADF	1991-02-28
Michael Hess	Business (ADFA)	2004-05-21
David Lovell	Humanities and Social Sciences (ADFA)	1983-12-16
Christopher Taylor	Business Law and Taxation	1989-07-17
David Waite	Civil and Environmental Engineering	1993-07-05
John Ballard	Biotechnology and Biomolecular Sciences	2005-02-01
Paul Brown	History and Philosophy	1994-01-04
Brian Lees	Physical, Environmental and Mathematical Sciences (ADF	2002-06-26
Maurice Pagnucco	Computer Science and Engineering	2010-07-01
\.

COPY q2_expected (status, name, school, starting) FROM stdin;
Longest serving	Stephen Frenkel	Organisation and Management	1975-07-14
Most recent	Maurice Pagnucco	Computer Science and Engineering	2010-07-01
\.

COPY q3_expected (code, year, sess, name) FROM stdin;
PHCM9748	2010	S2	Tony Butler
\.

COPY q4_expected (term, percent) FROM stdin;
05s1	0.24
05s2	0.23
06s1	0.23
06s2	0.23
07s1	0.23
07s2	0.23
08s1	0.25
08s2	0.26
09s1	0.26
09s2	0.27
10s1	0.27
10s2	0.29
11s1	0.30
\.

COPY q5_expected (term, nstudes, fte) FROM stdin;
00s1	5527	4990.3
00s2	5790	5219.3
01s1	6323	5454.3
01s2	6350	5511.0
02s1	6813	5816.4
02s2	7105	5988.3
03s1	7119	5994.9
03s2	6836	5742.7
04s1	6897	5734.5
04s2	6581	5486.1
05s1	6549	5305.0
05s2	6174	4954.5
06s1	6077	4905.4
06s2	5872	4750.8
07s1	5990	4847.4
07s2	5854	4741.2
08s1	6117	4980.9
08s2	6030	4927.2
09s1	6724	5512.6
09s2	6829	5566.4
10s1	7362	6128.7
10s2	7279	6094.9
\.

COPY q6_expected (subject, nofferings) FROM stdin;
GEND4209 Working with Jewellery	32
MDCN0003 Medicine: Short Course (St V)	32
GEND4208 Working with Ceramics	32
FINS5511 Corporate Finance	34
GEND4210 Textiles and Fashion	31
MDCN0001 Medicine:Short Course (SWSAHS)	31
MDCN0002 Medicine: Short Course (St G)	31
GEND1204 Studies in Painting	32
\.

COPY q7a_expected (room, facility) FROM stdin;
Sir John Clancy Auditorium	Radio microphone
Applied Science Theatre 1	Radio microphone
Biomedical Lecture Theatre A	Radio microphone
Biomedical Lecture Theatre B	Radio microphone
Biomedical Lecture Theatre C	Radio microphone
Biomedical Lecture Theatre D	Radio microphone
Central Lecture Block Theatre 7	Radio microphone
MAT-310	Radio microphone
Matthews Theatre A	Radio microphone
Matthews Theatre B	Radio microphone
Matthews Theatre C	Radio microphone
Matthews Theatre D	Radio microphone
Murphy Theatre	Radio microphone
OMB-112	Radio microphone
Physics Theatre	Radio microphone
Macauley Theatre	Radio microphone
Red Centre Theatre	Radio microphone
Rex Vowels Theatre	Radio microphone
Rupert Myers Theatre	Radio microphone
Smith Theatre	Radio microphone
Webster Theatre A	Radio microphone
Webster Theatre B	Radio microphone
\.

COPY q7b_expected (room, facility) FROM stdin;
AS-301	Blackboard
AS-G05	Blackboard
Applied Science Theatre 1	Blackboard
B11A-101	Blackboard
B9-160	Blackboard
B9-170	Blackboard
Biomedical Lecture Theatre A	Blackboard
Biomedical Lecture Theatre B	Blackboard
Biomedical Lecture Theatre C	Blackboard
Biomedical Lecture Theatre D	Blackboard
Biomedical Lecture Theatre E	Blackboard
Biomedical Lecture Theatre F	Blackboard
CE-102	Blackboard
CE-713	Blackboard
CE-G6	Blackboard
CE-G8	Blackboard
CHEM-611	Blackboard
CHEM-613	Blackboard
CHEM-614	Blackboard
Central Lecture Block Theatre 1	Blackboard
Central Lecture Block Theatre 2	Blackboard
Central Lecture Block Theatre 3	Blackboard
Central Lecture Block Theatre 4	Blackboard
Central Lecture Block Theatre 5	Blackboard
Central Lecture Block Theatre 6	Blackboard
Central Lecture Block Theatre 7	Blackboard
Central Lecture Block Theatre 8	Blackboard
Dwyer Theatre	Blackboard
EE-218	Blackboard
EE-219	Blackboard
EE-220	Blackboard
EE-221	Blackboard
EE-222	Blackboard
EE-418	Blackboard
Electrical Engineering G24	Blackboard
Electrical Engineering G25	Blackboard
JG-LG21	Blackboard
Keith Burrows Theatre	Blackboard
MAT-102	Blackboard
MAT-1021	Blackboard
MAT-1024	Blackboard
MAT-104	Blackboard
MAT-1216	Blackboard
MAT-1226	Blackboard
MAT-123	Blackboard
MAT-130	Blackboard
MAT-301	Blackboard
MAT-302	Blackboard
MAT-303	Blackboard
MAT-306	Blackboard
MAT-307	Blackboard
MAT-308	Blackboard
MAT-309	Blackboard
MAT-310	Blackboard
MAT-311	Blackboard
MAT-312	Blackboard
MAT-313	Blackboard
MAT-921	Blackboard
MAT-924	Blackboard
MAT-929	Blackboard
Matthews Theatre A	Blackboard
Matthews Theatre B	Blackboard
Matthews Theatre C	Blackboard
Matthews Theatre D	Blackboard
MB-307	Blackboard
MB-308B	Blackboard
MB-G3	Blackboard
MB-G4	Blackboard
MB-G5	Blackboard
MB-G7	Blackboard
MB-LG30	Blackboard
ME-303	Blackboard
ME-304	Blackboard
Mellor Theatre	Blackboard
Murphy Theatre	Blackboard
Nyholm Theatre	Blackboard
OMB-112	Blackboard
OMB-113	Blackboard
OMB-114	Blackboard
OMB-115	Blackboard
OMB-116	Blackboard
OMB-117	Blackboard
OMB-145A	Blackboard
OMB-149A	Blackboard
OMB-150	Blackboard
OMB-232	Blackboard
Physics Theatre	Blackboard
Macauley Theatre	Blackboard
QUAD-1042	Blackboard
QUAD-1045	Blackboard
QUAD-1046	Blackboard
QUAD-1047	Blackboard
QUAD-1048	Blackboard
QUAD-1049	Blackboard
QUAD-G022	Blackboard
QUAD-G025	Blackboard
QUAD-G026	Blackboard
QUAD-G027	Blackboard
QUAD-G031	Blackboard
QUAD-G032	Blackboard
QUAD-G034	Blackboard
QUAD-G035	Blackboard
QUAD-G040	Blackboard
QUAD-G041	Blackboard
QUAD-G042	Blackboard
QUAD-G044	Blackboard
QUAD-G045	Blackboard
QUAD-G046	Blackboard
QUAD-G047	Blackboard
QUAD-G048	Blackboard
QUAD-G052	Blackboard
QUAD-G053	Blackboard
QUAD-G054	Blackboard
QUAD-G055	Blackboard
RC-1040	Blackboard
RC-1041	Blackboard
RC-1042	Blackboard
RC-1043	Blackboard
RC-2060	Blackboard
RC-2061	Blackboard
RC-2062	Blackboard
RC-2063	Blackboard
RC-M032	Blackboard
Red Centre Theatre	Blackboard
Rex Vowels Theatre	Blackboard
Smith Theatre	Blackboard
WEBSTER-236	Blackboard
Webster Theatre A	Blackboard
Webster Theatre B	Blackboard
\.

COPY q7c_expected (room, facility) FROM stdin;
\.

COPY q7d_expected (room, facility) FROM stdin;
MAT-1021	Fan ventilation
MAT-1024	Fan ventilation
MAT-1216	Fan ventilation
MAT-1226	Fan ventilation
MAT-301	Fan ventilation
MAT-302	Fan ventilation
MAT-303	Fan ventilation
MAT-306	Fan ventilation
MAT-307	Fan ventilation
MAT-308	Fan ventilation
MAT-309	Fan ventilation
MAT-310	Fan ventilation
MAT-311	Fan ventilation
MAT-312	Fan ventilation
MAT-313	Fan ventilation
MAT-921	Fan ventilation
MAT-924	Fan ventilation
MAT-929	Fan ventilation
NEWTON-306	Fan ventilation
NEWTON-307	Fan ventilation
QUAD-1042	Fan ventilation
QUAD-1045	Fan ventilation
QUAD-1046	Fan ventilation
QUAD-1047	Fan ventilation
QUAD-1048	Fan ventilation
QUAD-1049	Fan ventilation
QUAD-G022	Fan ventilation
QUAD-G025	Fan ventilation
QUAD-G026	Fan ventilation
QUAD-G027	Fan ventilation
QUAD-G031	Fan ventilation
QUAD-G032	Fan ventilation
QUAD-G048	Fan ventilation
QUAD-G052	Fan ventilation
QUAD-G053	Fan ventilation
WC-101	Fan ventilation
\.

COPY q7e_expected (room, facility) FROM stdin;
Applied Science Theatre 1	Lectern with networked computer
Biomedical Lecture Theatre A	Lectern with networked computer
Biomedical Lecture Theatre B	Lectern with networked computer
Biomedical Lecture Theatre C	Lectern with networked computer
Biomedical Lecture Theatre D	Lectern with networked computer
Biomedical Lecture Theatre E	Lectern with networked computer
Biomedical Lecture Theatre F	Lectern with networked computer
CE-713	Lectern with networked computer
CE-G1	Lectern with networked computer
Central Lecture Block Theatre 1	Lectern with networked computer
Central Lecture Block Theatre 2	Lectern with networked computer
Central Lecture Block Theatre 3	Lectern with networked computer
Central Lecture Block Theatre 4	Lectern with networked computer
Central Lecture Block Theatre 5	Lectern with networked computer
Central Lecture Block Theatre 6	Lectern with networked computer
Central Lecture Block Theatre 7	Lectern with networked computer
Central Lecture Block Theatre 8	Lectern with networked computer
Dwyer Theatre	Lectern with networked computer
Electrical Engineering G24	Lectern with networked computer
Electrical Engineering G25	Lectern with networked computer
Keith Burrows Theatre	Lectern with networked computer
LAW-1042	Lectern with networked computer
MAT-312	Lectern with networked computer
Matthews Theatre A	Lectern with networked computer
Matthews Theatre B	Lectern with networked computer
Matthews Theatre C	Lectern with networked computer
Matthews Theatre D	Lectern with networked computer
MB-G3	Lectern with networked computer
MB-G4	Lectern with networked computer
ME-303	Lectern with networked computer
Mellor Theatre	Lectern with networked computer
Murphy Theatre	Lectern with networked computer
Nyholm Theatre	Lectern with networked computer
OMB-112	Lectern with networked computer
OMB-145	Lectern with networked computer
Physics Theatre	Lectern with networked computer
Macauley Theatre	Lectern with networked computer
QUAD-G031	Lectern with networked computer
RC-M032	Lectern with networked computer
Red Centre Theatre	Lectern with networked computer
Rex Vowels Theatre	Lectern with networked computer
Smith Theatre	Lectern with networked computer
Webster Theatre A	Lectern with networked computer
Webster Theatre B	Lectern with networked computer
\.

COPY q7f_expected (room, facility) FROM stdin;
\.

COPY q8a_expected (q8) FROM stdin;
05x1
\.

COPY q8b_expected (q8) FROM stdin;
05s1
\.

COPY q8c_expected (q8) FROM stdin;
05x2
\.

COPY q8d_expected (q8) FROM stdin;
09x1
\.

COPY q8e_expected (q8) FROM stdin;
09s1
\.

COPY q8f_expected (q8) FROM stdin;
\N
\.

COPY q9a_expected (code, term, name, mark, grade, uoc) FROM stdin;
COMP1711	05s1	Higher Computing 1A	76	DN	6
MATH1081	05s1	Discrete Mathematics	57	PS	6
MATH1131	05s1	Mathematics 1A	59	PS	6
PHYS1121	05s1	Physics 1A	56	PS	6
COMP1721	05s2	Higher Computing 1B	76	DN	6
ELEC1011	05s2	Electrical Engineering 1	62	PS	6
MATH1231	05s2	Mathematics 1B	61	PS	6
PHYS1601	05s2	Comp. Applic'ns in Exp. Sci. 1	94	HD	6
GENL0230	06x1	Law in the Information Age	78	DN	3
COMP2121	06s1	Microprocessors & Interfacing	50	PS	6
COMP2711	06s1	Higher Data Organisation	63	PS	6
COMP2920	06s1	Professional Issues and Ethics	73	CR	3
MATH2301	06s1	Mathematical Computing	48	PC	6
COMP2041	06s2	Software Construction	82	DN	6
COMP3421	06s2	Computer Graphics	68	CR	6
GENS4015	06s2	Brave New World	63	PS	3
INFS1602	06s2	Info Systems in Business	62	PS	6
PHYS2630	06s2	Electronics	63	PS	3
COMP3111	07s1	Software Engineering	67	CR	6
COMP3331	07s1	Computer Networks&Applications	66	CR	6
COMP3411	07s1	Artificial Intelligence	60	PS	6
GENL2020	07s1	Intro to Australian Legal Sys	69	CR	3
COMP3121	07s2	Algorithms & Programming Tech	54	PS	6
COMP3222	07s2	Digital Circuits and Systems	65	CR	6
MATH3411	07s2	Information, Codes and Ciphers	50	PS	6
GENS4001	08x1	Astronomy	84	DN	3
COMP3311	\N	Advanced standing, based on ...	\N	\N	6
\N	\N	study at The University of Sydney	\N	\N	\N
\N	\N	Overall WAM	64	\N	144
\.

COPY q9b_expected (code, term, name, mark, grade, uoc) FROM stdin;
COMP1911	07s1	Computing 1A	79	DN	6
ENGG1000	07s1	Engineering Design	63	PS	6
INFS1603	07s1	Business Databases	81	DN	6
MATH1131	07s1	Mathematics 1A	63	PS	6
COMP1921	07s2	Computing 1B	63	PS	6
INFS1602	07s2	Info Systems in Business	59	PS	6
MATH1081	07s2	Discrete Mathematics	59	PS	6
MATH1231	07s2	Mathematics 1B	73	CR	6
GENM0703	08x1	Concept of Phys Fitness&Health	63	PS	3
GENS8004	08x1	Ergonomics, Product & Safety	77	DN	3
ACCT1501	08s1	Accounting & Financial Mgt 1A	61	PS	6
COMP2911	08s1	Eng. Design in Computing	67	CR	6
COMP2920	08s1	Professional Issues and Ethics	83	DN	3
COMP2041	08s2	Software Construction	76	DN	6
COMP2121	08s2	Microprocessors & Interfacing	63	PS	6
COMP9315	08s2	Database Systems Implementat'n	52	PS	6
ARTS1450	09s1	Introductory Chinese A	68	CR	6
COMP3141	09s1	Software Sys Des&Implementat'n	73	CR	6
COMP9318	09s1	Data Warehousing & Data Mining	63	PS	6
COMP9321	09s1	Web Applications Engineering	75	DN	6
COMP3421	09s2	Computer Graphics	67	CR	6
COMP3711	09s2	Software Project Management	75	DN	6
COMP9322	09s2	Service-Oriented Architectures	71	CR	6
COMP9323	09s2	e-Enterprise Project	85	HD	6
GENC7003	09s2	Managing Your Business	73	CR	3
COMP3311	\N	Exemption, based on ...	\N	\N	\N
\N	\N	study at The University of Sydney	\N	\N	\N
\N	\N	Overall WAM	68	\N	138
\.

COPY q9c_expected (code, term, name, mark, grade, uoc) FROM stdin;
INFS1602	08s2	Info Systems in Business	68	CR	6
MATH1081	08s2	Discrete Mathematics	68	CR	6
MATH1131	08s2	Mathematics 1A	81	DN	6
MATH1231	09x1	Mathematics 1B	82	DN	6
COMP2121	09s1	Microprocessors & Interfacing	92	HD	6
COMP2911	09s1	Eng. Design in Computing	91	HD	6
MATH2301	09s1	Mathematical Computing	70	CR	6
SENG4921	09s1	Professional Issues and Ethics	82	DN	6
COMP3171	09s2	Object-Oriented Programming	88	HD	6
COMP3331	09s2	Computer Networks&Applications	97	HD	6
COMP3421	09s2	Computer Graphics	65	CR	6
MATH2871	09s2	Data Manag't for Stat Analysis	94	HD	6
COMP3141	10s1	Software Sys Des&Implementat'n	82	DN	6
COMP3311	10s1	Database Systems	87	HD	6
COMP4317	10s1	XML and Databases	88	HD	6
COMP9332	10s1	Network Routing and Switching	66	CR	6
SESC2001	10s1	Safety, Health and Environment	91	HD	6
COMP2041	10s2	Software Construction	97	HD	6
COMP4001	10s2	Object-Oriented Software Dev	87	HD	6
COMP9321	10s2	Web Applications Engineering	76	DN	6
COMP9322	10s2	Service-Oriented Architectures	80	DN	6
MSCI0501	10s2	The Marine Environment	66	CR	6
COMP3131	11s1	Programming Languages & Compil	\N	\N	6
COMP3891	11s1	Ext Operating Systems	\N	\N	6
COMP4910	11s1	Thesis Part A	\N	\N	3
COMP9318	11s1	Data Warehousing & Data Mining	\N	\N	6
COMP9319	11s1	Web Data Compression & Search	\N	\N	6
COMP1917	\N	Advanced standing, based on ...	\N	\N	6
\N	\N	study at The University of Sydney	\N	\N	\N
COMP1927	\N	Advanced standing, based on ...	\N	\N	6
\N	\N	study at The University of Sydney	\N	\N	\N
\N	\N	Overall WAM	81	\N	144
\.

COPY q9d_expected (code, term, name, mark, grade, uoc) FROM stdin;
COMP1911	07s1	Computing 1A	79	DN	6
ENGG1000	07s1	Engineering Design	63	PS	6
INFS1603	07s1	Business Databases	81	DN	6
MATH1131	07s1	Mathematics 1A	63	PS	6
COMP1921	07s2	Computing 1B	63	PS	6
INFS1602	07s2	Info Systems in Business	59	PS	6
MATH1081	07s2	Discrete Mathematics	59	PS	6
MATH1231	07s2	Mathematics 1B	73	CR	6
GENM0703	08x1	Concept of Phys Fitness&Health	63	PS	3
GENS8004	08x1	Ergonomics, Product & Safety	77	DN	3
ACCT1501	08s1	Accounting & Financial Mgt 1A	61	PS	6
COMP2911	08s1	Eng. Design in Computing	67	CR	6
COMP2920	08s1	Professional Issues and Ethics	83	DN	3
COMP2041	08s2	Software Construction	76	DN	6
COMP2121	08s2	Microprocessors & Interfacing	63	PS	6
COMP9315	08s2	Database Systems Implementat'n	52	PS	6
ARTS1450	09s1	Introductory Chinese A	68	CR	6
COMP3141	09s1	Software Sys Des&Implementat'n	73	CR	6
COMP9318	09s1	Data Warehousing & Data Mining	63	PS	6
COMP9321	09s1	Web Applications Engineering	75	DN	6
COMP3421	09s2	Computer Graphics	67	CR	6
COMP3711	09s2	Software Project Management	75	DN	6
COMP9322	09s2	Service-Oriented Architectures	71	CR	6
COMP9323	09s2	e-Enterprise Project	85	HD	6
GENC7003	09s2	Managing Your Business	73	CR	3
COMP3311	\N	Exemption, based on ...	\N	\N	\N
\N	\N	study at The University of Sydney	\N	\N	\N
\N	\N	Overall WAM	68	\N	138
\.

COPY q9e_expected (code, term, name, mark, grade, uoc) FROM stdin;
COMP1711	04s1	Higher Computing 1A	76	DN	6
INFS1603	04s1	Business Databases	\N	NC	6
MATH1081	04s1	Discrete Mathematics	55	PS	6
MATH1141	04s1	Higher Mathematics 1A	72	CR	6
COMP1721	04s2	Higher Computing 1B	89	HD	6
ELEC1011	04s2	Electrical Engineering 1	\N	NF	6
MATH1231	04s2	Mathematics 1B	60	PS	6
PHYS1601	04s2	Comp. Applic'ns in Exp. Sci. 1	70	CR	6
COMP2021	05s1	Digital System Structures	37	FL	6
COMP2111	05s1	System Modelling and Design	21	FL	6
COMP2711	05s1	Higher Data Organisation	48	PC	6
JAPN1000	05s1	Japanese Communication 1A	68	CR	6
COMP2021	05s2	Digital System Structures	\N	AF	6
COMP2041	05s2	Software Construction	61	PS	6
COMP3121	05s2	Algorithms & Programming Tech	\N	AF	6
COMP3421	05s2	Computer Graphics	18	FL	6
COMP3121	06s1	Algorithms & Programming Tech	2	FL	6
COMP3311	06s1	Database Systems	\N	AF	6
COMP3331	06s1	Computer Networks&Applications	54	PS	6
COMP3411	06s1	Artificial Intelligence	45	FL	6
COMP3131	06s2	Programming Languages & Compil	23	FL	6
COMP3421	06s2	Computer Graphics	65	CR	6
COMP3511	06s2	Human Computer Interaction	65	CR	6
COMP9334	06s2	Systems Capacity Planning	\N	NF	6
COMP2121	07s1	Microprocessors & Interfacing	64	PS	6
COMP3131	07s1	Programming Languages & Compil	69	CR	6
COMP3153	07s1	Algorithmic Verification	\N	NF	6
COMP4001	07s1	Object-Oriented Software Dev	52	PS	6
GENC7002	07s1	Getting Into Business	59	PS	3
COMP2920	07s2	Professional Issues and Ethics	53	PS	3
COMP3161	07s2	Concepts of Programming Lang.	22	FL	6
COMP4317	07s2	XML and Databases	15	FL	6
COMP9517	07s2	Computer Vision	9	FL	6
GENS6033	07s2	HIV&Other Unconquered Infect'n	13	FL	3
GENS6033	08x1	HIV&Other Unconquered Infect'n	0	FL	3
COMP3141	08s1	Software Sys Des&Implementat'n	50	PS	6
COMP3411	08s1	Artificial Intelligence	21	FL	6
COMP9417	08s1	Machine Learning & Data Mining	\N	AF	6
COMP3161	08s2	Concepts of Programming Lang.	33	FL	6
COMP9519	08s2	Multimedia Systems	57	PS	6
COMP3411	10s1	Artificial Intelligence	54	PS	6
COMP3711	10s1	Software Project Management	61	PS	6
COMP4317	10s1	XML and Databases	\N	NF	6
ENGG1811	10s1	Computing for Engineers	80	DN	6
COMP2911	10s2	Eng. Design in Computing	66	CR	6
INFS1603	10s2	Business Databases	62	PS	6
COMP9332	11s1	Network Routing and Switching	\N	\N	6
CRIM1010	11s1	Intro to Criminology	\N	\N	6
COMP3111	\N	Substitution, based on ...	\N	\N	\N
\N	\N	studying COMP3141 at UNSW	\N	\N	\N
\N	\N	Overall WAM	48	\N	138
\.

COPY q9f_expected (code, term, name, mark, grade, uoc) FROM stdin;
TELE9301	05s1	Switching System Design	50	PS	6
TELE9302	05s1	Computer Networks	61	PS	6
TELE9343	05s1	Principles of Digital Comm	54	PS	6
TELE9344	05s1	Cellular Mobile Communications	60	PS	6
COMP9311	05s2	Database Systems	66	CR	6
ELEC9355	05s2	Optical Communications Systems	53	PS	6
TELE9303	05s2	Network Management	60	PS	6
TELE9337	05s2	Advanced Networking	53	PS	6
COMP3111	\N	Substitution, based on ...	\N	\N	\N
\N	\N	studying COMP3711 at UNSW	\N	\N	\N
\N	\N	Overall WAM	57	\N	48
\.

