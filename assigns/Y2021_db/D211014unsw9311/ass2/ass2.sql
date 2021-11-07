-- COMP9311 Assignment 2
-- Written by YOUR_NAME 

-- Q1: get details of the current Heads of Schools

create or replace view Q1(name, school, starting)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q2: longest-serving and most-recent current Heads of Schools

create or replace view Q2(status, name, school, starting)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q3: highest average mark 

create or replace view Q3(code, year, sess, name)
as
$$
... one SQL statement, possibly using other views defined by you ...
$$ language sql;


-- Q4: percentage of international students, S1 and S2, 2005..2011

create or replace view Q4(term, percent)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q5: total FTE students per term from 2001 S1 to 2010 S2

create or replace view Q5(term, nstudes, fte)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q6: subjects with > 30 course offerings and no staff recorded

create or replace view Q6(subject, nOfferings)
as
... one SQL statement, possibly using other views defined by you ...
;

-- Q7:  which rooms have a given facility

create or replace function
	Q7(text) returns setof FacilityRecord
as $$
... one SQL statement, possibly using other views defined by you ...
$$ language sql
;

-- Q8: semester containing a particular day

create or replace function Q8(_day date) returns text 
as $$
declare
	... PLpgSQL variable delcarations ...
begin
	... PLpgSQL code ...
end;
$$ language plpgsql
;

-- Q9: transcript with variations

create or replace function
	q9(_sid integer) returns setof TranscriptRecord
as $$
declare
	... PLpgSQL variable delcarations ...
begin
	... PLpgSQL code ...
end;
$$ language plpgsql
;
