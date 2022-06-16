-- COMP9311 Assignment 2
-- Written by YOUR_NAME 

-- Q1: get details of the current Heads of Schools

create or replace view Q1(name, school, starting)
as
select p.name, o.longname as school, a.starting
from people p
join affiliation a on a.staff=p.id
join orgunits o on o.id=a.orgunit
join orgunittypes ot on ot.id=o.utype
join staffroles sr on sr.id=a.role
where a.isprimary='t'
and lower(ot.name)='school'
and sr.description='Head of School'
and a.ending is null
order by starting
;

-- Q2: longest-serving and most-recent current Heads of Schools

create or replace view Q2(status, name, school, starting)
as
select 'Longest serving' status,
name, school, starting
from Q1
where starting=(select min(starting) from Q1)
union
select 'Most recent' status,
name, school, starting
from Q1
where starting=(select max(starting) from Q1)
;

-- Q3: highest average mark 

create or replace view Q3(code, year, sess, name)
as
select s.code, t.year, t.sess, p.name
from courses c
join subjects s on s.id=c.subject
join terms t on t.id=c.term
join coursestaff cs on cs.course=c.id
join people p on p.id=cs.staff
join courseroles cr on cr.id=cs.role
join
(
select course, avgmark
from
(
select ce.course, avg(ce.mark) as avgmark
from courseenrolments ce
group by ce.course having count(ce.student)>20
) t
where avgmark=(select max(avgmark) from (
select ce.course, avg(ce.mark) as avgmark
from courseenrolments ce
group by ce.course having count(ce.student)>20
) tt
)
) ttt on ttt.course=c.id
where cr.name='Convenor'
;


-- Q4: percentage of international students, S1 and S2, 2005..2011

create or replace view Q4(term, percent)
as
select lower(substring(t.year::text from 3 for 2)|| t.sess) as term,
round(count(distinct s.id)::numeric/tt.year_students,2) as percent
from programenrolments pe
join terms t on t.id=pe.term
join students s on s.id=pe.student
join
(
select lower(substring(t.year::text from 3 for 2)|| t.sess) as term, count(distinct s.id) as year_students
from
programenrolments pe
join terms t on t.id=pe.term
join students s on s.id=pe.student
where t.sess in ('S1', 'S2')
and t.year between 2005 and 2011
group by lower(substring(t.year::text from 3 for 2)|| t.sess)
) tt on tt.term= lower(substring(t.year::text from 3 for 2)|| t.sess)
where s.stype='intl'
and t.sess in ('S1', 'S2')
and t.year between 2005 and 2011
group by lower(substring(t.year::text from 3 for 2)|| t.sess),
tt.year_students
order by term
;

-- Q5: total FTE students per term from 2001 S1 to 2010 S2

create or replace view Q5(term, nstudes, fte)
as
select lower(substring(t.year::text from 3 for 2)|| t.sess) as term,
count(distinct ce.student) as nstudes,
round(sum(sj.uoc)::numeric/24,1) as fte
from terms t
join courses c on c.term=t.id
join courseenrolments ce on ce.course=c.id
join subjects sj on sj.id=c.subject
where t.sess in ('S1', 'S2')
and t.year between 2000 and 2010
group by lower(substring(t.year::text from 3 for 2)|| t.sess)
;

-- Q6: subjects with > 30 course offerings and no staff recorded

create or replace view Q6(subject, nOfferings)
as
select concat(sj.code,' ', sj.name) as subject, count(c.id) as nOfferings
from subjects sj
join courses c on c.subject=sj.id
where sj.id not in (select distinct s1.id
from subjects s1 join courses c1 on c1.subject=s1.id
join coursestaff cs on cs.course=c1.id
group by s1.id
having count(cs.staff)>0
)
group by sj.code, sj.name
having count(c.id)>30
;

-- Q7:  which rooms have a given facility

create or replace function
	Q7(text) returns setof FacilityRecord
as $$
select r.longname as room, f.description as facility
from rooms r
join roomfacilities rf on rf.room=r.id
join facilities f on f.id=rf.facility
where lower(f.description) like '%'||lower($1)||'%'
$$ language sql
;

-- Q8: semester containing a particular day
create or replace view Q8_view
as
select tt.id,tt.year,tt.sess,tt.starting,tt.ending,
tt.actual_starting,
(
select min(tt1.actual_starting)-1
from
(
select *,
(
select t1.starting-7
from terms t1
where t1.id=t.id
) actual_starting
from terms t
order by starting
) tt1 where tt.ending<=tt1.actual_starting
) as actual_ending
from
(
select *,
(
select t1.starting-7
from terms t1
where t1.id=t.id
) actual_starting
from terms t
order by starting
) tt  order by actual_starting;

create or replace function Q8(_day date) returns text 
as $$
declare
term_id integer :=0;
term_name text;
begin
select id into term_id
from Q8_view where _day between actual_starting and actual_ending;
if (not found) then
    return null;
--    raise EXCEPTION 'Invalid date %',_day;
end if;
select lower(substring(year::text,3,2)||sess) into term_name
from terms where id=term_id;
return term_name;
end;
$$ language plpgsql
;

-- Q9: transcript with variations

create or replace function
	q9(_sid integer) returns setof TranscriptRecord
as $$
declare
        rec TranscriptRecord;
        UOCtotal integer := 0;
        UOCpassed integer := 0;
        wsum integer := 0;
        wam integer := 0;
        pid integer;

begin
    select p.id into pid
    from people p  where p.unswid=_sid;
    if (not found) then
        raise EXCEPTION 'Invalid student %',_sid;
    end if;

    for rec in
        select su.code, substr(t.year::text,3,2)||lower(t.sess) as term,
                        su.name, e.mark, e.grade, su.uoc
                from   CourseEnrolments e join Students s on (e.student = s.id)
                        join People p on (s.id = p.id)
                        join Courses c on (e.course = c.id)
                        join Subjects su on (c.subject = su.id)
                        join Terms t on (c.term = t.id)
                where  p.unswid = _sid
                order by t.starting,su.code

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
                end if;
                return next rec;
    end loop;

    for rec in

        select su.code, null as term,
        (case when v.vtype like 'exem%' then 'Exemption, based on ...'
         when v.vtype like 'subs%' and v.intequiv is not null
         then 'Substitution, based on ...'
         when v.vtype like 'advs%' then 'Advanced standing, based on ...'
         end
        ) as name,
--        (case when v.vtype like 'subs%' then v.mark else null end) mark,
        null as mark,
        null as grade,
        (case when v.vtype like 'advs%' then su.uoc else null end ) uoc
        from subjects su
        join variations v on v.subject=su.id
--        join externalsubjects ex on ex.id=v.extequiv
        join students s on s.id=v.student
        where s.id=pid

        union

        select null as code, null as term,
        (
        case
        when v.vtype like 'subs%' and v.intequiv is not null then concat('studying',' ',su.code , ' at UNSW')
        when v.vtype like 'advs%' then concat('study at',' ',es.institution)
        when v.vtype like 'exem%' then concat('study at',' ',es.institution)
        end
        ) as name,
        null as mark,
        null as grade,
        null as uoc
        from
        variations v
--        on v.subject=su.id
        join students s on s.id=v.student
        join externalsubjects es on v.extequiv=es.id
        join subjects su on es.equivto=su.id
        where v.extequiv is not null and s.id=pid

        union all
        select null as code, null as term,
        (
        case when v.vtype like 'subs%' and v.intequiv is not null
        then concat('studying',' ',su.code , ' at UNSW')
        end
        ) as name,
        null as mark,
        null as grade,
        null as uoc
        from subjects su
        join variations v on v.intequiv=su.id
        join students s on s.id=v.student
        where s.id=pid and v.extequiv is null
        order by term,code
    loop
        if(rec.mark is null and rec.uoc is not null ) then
             UOCpassed := UOCpassed + rec.uoc;
           end if;
           if(rec.mark is not null and rec.uoc is not null) then
             rec.uoc :=null;
             rec.mark :=null;
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
$$ language plpgsql
;
