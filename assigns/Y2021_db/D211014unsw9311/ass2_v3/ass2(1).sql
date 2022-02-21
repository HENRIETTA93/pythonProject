-- COMP9311 Assignment 2
-- Written by Jing Zhu 

-- Q1: get details of the current Heads of Schools

create or replace view Q1(name, school, starting)
as select distinct people.name,orgunits.longname,affiliation.starting  from 
(people inner join affiliation on people.id=affiliation.staff) 
inner join orgunits on affiliation.orgunit=orgunits.id 
where affiliation.isprimary='t' and orgunits.utype=2 
and affiliation.ending is null and affiliation.role=1054;


-- Q2: longest-serving and most-recent current Heads of Schools

create or replace view Q2(status, name, school, starting)
as
	(select 'Longest serving',* from Q1 where starting=(select min(starting)
	  from Q1)) 
	union (select 'Most recent',* from Q1 where starting =(select max(starting)
	  from Q1))
;

-- Q3: highest average mark 
drop VIEW IF EXISTS tmp1 CASCADE;
create or REPLACE view tmp1 as select course ,avg(mark) as a From courseenrolments where mark is not null
    GROUP BY course HAVING count(*)>20 order by a desc ;

create or replace view Q3(code, year, sess, name)
as
select code ,year,sess, people.name  from terms,subjects,people where  
terms.id=(select term from courses 
    where courses.id=(select course as c from tmp1 
    where a=(select max(a) from tmp1))) and 
subjects.id=(select subject from courses 
    where courses.id=(select course  from tmp1 
    where a=(select max(a) from tmp1))) and 
people.id=(select coursestaff.staff from coursestaff 
        where coursestaff.course=(select course  from tmp1 
    where a=(select max(a) from tmp1)) and coursestaff.role=1)
    
;


-- Q4: percentage of international students, S1 and S2, 2005..2011

drop VIEW IF EXISTS tmp41 CASCADE;
drop VIEW IF EXISTS tmp42 CASCADE;
drop VIEW IF EXISTS tmp43 CASCADE;
create or replace view tmp41 as 
select  id,concat(substr(CAST (year AS text), 3),lower(sess)) as t
    from terms where year>=2005 and sess in('S1','S2');
CREATE or REPLACE VIEW tmp42 as
select term,count(student) as c1 from programenrolments GROUP by term;

CREATE or REPLACE VIEW tmp43 as select term,count(student) as c2 from programenrolments 
    WHERE student in(select id from students WHERE stype like 'intl') 
    and term in (select id from tmp41) GROUP BY term;



create or replace view Q4(term, percent)
as
select tmp41.t, round((c2+0.0)/c1,2) from (tmp41 INNER JOIN tmp42 on tmp42.term=tmp41.id) inner join tmp43 on tmp41.id=tmp43.term;


-- Q5: total FTE students per term from 2001 S1 to 2010 S2
drop VIEW IF EXISTS tmp55 CASCADE;
drop VIEW IF EXISTS tmp54 CASCADE;
drop VIEW IF EXISTS tmp53 CASCADE;
drop VIEW IF EXISTS tmp52 CASCADE;
drop VIEW IF EXISTS tmp51 CASCADE;
create or replace view tmp51 as 
select  id,concat(substr(CAST (year AS text), 3),lower(sess)) as t
    from terms where year>=2000 and YEAR <=2010  and sess in('S1','S2');

CREATE or REPLACE VIEW tmp52 as 
select course,count(student) as c from courseenrolments GROUP BY course;

create VIEW tmp53 as 
    select course,student,tmp51.id,t from courseenrolments 
    left join courses on courses.id=courseenrolments.course 
    left join tmp51 on tmp51.id=courses.term where tmp51.id is not null;

CREATE or REPLACE VIEW tmp54 as 
    select t ,count(distinct (student)) as b from tmp53 GROUP BY t;

CREATE or REPLACE VIEW tmp55 as 
    select t,round(sum(c*uoc+0.0)/24,1) as a  from 
    (courses inner join tmp51 on tmp51.id=courses.term) 
        left join subjects on subjects.id=courses.subject 
        left join tmp52 on tmp52.course=courses.id GROUP BY t;
create or replace view Q5(term, nstudes, fte)
as select tmp54.t,b,a from tmp54 inner join tmp55 on tmp54.t=tmp55.t;

-- Q6: subjects with > 30 course offerings and no staff recorded

drop VIEW IF EXISTS tmp61 CASCADE;
drop VIEW IF EXISTS tmp62 CASCADE;
CREATE or REPLACE VIEW tmp61 as 
select distinct(subject)as f from courses 
    where courses.id in( select course from coursestaff);

CREATE or REPLACE VIEW tmp62 as 
    select subject,count(id)  as t FROM courses 
        where subject not in(select f from tmp61) 
            GROUP BY subject having count(id)>30;


    
create or replace view Q6(subject, nOfferings)
as select concat(subjects.code,' ',subjects.name) ,tmp62.t 
from tmp62 left join subjects on subjects.id=tmp62.subject 
where id in (select subject from  tmp62 ) ;


-- Q7:  which rooms have a given facility

drop VIEW IF EXISTS tmp71 CASCADE;
create or replace VIEW tmp71
as
select t.longname as name, facilities.description
from
(
select rooms.*, roomfacilities.facility
from rooms
inner join roomfacilities on rooms.id=roomfacilities.room
) t
inner join facilities on t.facility=facilities.id;

create or replace function
	Q7(text) returns setof FacilityRecord
as $$
select *
from tmp71
where lower(description) ~ lower($1);
$$ language sql
;

-- Q8: semester containing a particular day

drop TYPE  if exists item cascade;
create TYPE item as (
    y int ,
    sess CHAR(2),
    startTime date,
    nextStartTime date
);

create or replace function Q8(_day date) returns text 
as $$
declare
    result TEXT DEFAULT '';
    it item;
    itbefore item;
begin

it:=(select (year,sess,starting,ending)as it  from terms  
    where starting<=$1 and ending>=$1);
if it.y is not null then 
    result:=concat(substr(CAST ((it).y AS text), 3),lower((it).sess));
    return result;
ELSE 
    itbefore=(select (year,sess,starting,ending)as it from terms WHERE ending<=$1 
        and ending in (select max(ending) from terms WHERE ending<=$1));
    it:=(select (year,sess,starting,ending)as it from terms WHERE starting>=$1 
        and starting in (select min(starting) from terms WHERE starting>=$1));
    IF itbefore.y is null and it.y is null then
        return result;
    END IF;
    IF itbefore.y is null then
         result:=concat(substr(CAST ((it).year AS text), 3),lower((it).sess));
        return result;
    ELSIF it.startTime-itbefore.nextStartTime<7 then
        it.startTime=itbefore.nextStartTime+1;
    ELSE
        it.startTime=it.startTime-7;
        itbefore.nextStartTime=it.startTime-1;
    END IF;
    IF (it).startTime<=$1 then
    result:=concat(substr(CAST ((it).y AS text), 3),lower((it).sess));
    ELSIF (itbefore.nextStartTime>=$1) then
        result:=concat(substr(CAST ((itbefore).y AS text), 3),lower((itbefore).sess));
    END IF; 

END IF;

return result;
end;
$$ language plpgsql
;

drop TYPE if exists item1 CASCADE;
create TYPE item1 as(
    subid integer,
    vtype varchar,
    intid integer,
    extid integer
);
create or replace function
	q9(_sid integer) returns setof TranscriptRecord
 LANGUAGE plpgsql
AS $function$
declare
	rec TranscriptRecord;
	UOCtotal integer := 0;
	UOCpassed integer := 0;
	wsum integer := 0;
	wam integer := 0;
	x integer;
	study_at text :='study at ';
	unsw_u text :=' at UNSW';
	studying text :='studying ';
begin
	select s.id into x
	from   Students s join People p on (s.id = p.id)
	where  p.unswid = _sid;
	if (not found) then
		raise EXCEPTION 'Invalid student %',_sid;
	end if;
	for rec in
	    select code,term, name, mark, grade, uoc
	    from
	    (
		select su.code, substr(t.year::text,3,2)||lower(t.sess) as term,
			su.name, e.mark, e.grade, su.uoc, t.starting as starting
		from   CourseEnrolments e join Students s on (e.student = s.id)
			join People p on (s.id = p.id)
			join Courses c on (e.course = c.id)
			join Subjects su on (c.subject = su.id)
			join Terms t on (c.term = t.id)
		where  p.unswid = _sid

		union

		select su.code as code, null as term, (case v.vtype when 'exemption' then 'Exemption, based on ...'
		when 'substitution' then 'Substitution, based on ...'
		when 'advstanding' then  'Advanced standing, based on ...'
		end) as name,
		null as mark, null as grade,
		(case v.vtype when 'advstanding' then su.uoc else null end ) uoc, null starting
		from Variations v
		join Subjects su on (v.subject=su.id)
		join Students s on (s.id=v.student)
		where s.id=x

        union

        select null as code, null as term, (case v.vtype when 'exemption' then concat(study_at,ex.institution)
        when 'substitution' then concat(studying, su.code, unsw_u)
        when 'advstanding' then  concat(study_at,ex.institution)
        end ) as name,
        null as mark, null as grade, null as uoc, null starting
        from Variations v
		join Students s on (s.id=v.student)
		join Externalsubjects ex on (v.extequiv=ex.id)
		join Subjects su on (su.id=ex.equivto)
        where s.id=x

        union
        select  null as code, null as term ,( case v.vtype when 'substitution' then concat(studying, su.code, unsw_u) end)
        as name, null as mark, null as grade, null as uoc, null starting
        from Variations v
		join Students s on (s.id=v.student)
		join Subjects su on (su.id=v.intequiv)
        where s.id=x
        ) t
		order by starting, code
	loop
		if (rec.grade = 'SY') then
			UOCpassed := UOCpassed + rec.uoc;
		elsif (rec.mark is not null) then
			if (rec.grade in ('PT','PC','PS','CR','DN','HD')) then
				-- only counts towards creditted UOC
				-- if they passed the course
				UOCpassed := UOCpassed + rec.uoc;
			end if;
			-- we count fails towards the WAM calculation
			UOCtotal := UOCtotal + rec.uoc;
			-- weighted sum based on mark and uoc for course
			wsum := wsum + (rec.mark * rec.uoc);
		elsif  (rec.name like 'Advanced%' and rec.uoc is not null) then
		    UOCpassed :=UOCpassed+ rec.uoc;

		end if;

		return next rec;
	end loop;




	if (UOCtotal = 0) then
		rec := (null,null,'No WAM available',null,null,null);
	else
		wam := wsum / UOCtotal;
		rec := (null,null,'Overall WAM',wam,null,UOCpassed);
	end if;
	-- append the last record containing the WAM
	return next rec;
	return;
end;
$function$

;