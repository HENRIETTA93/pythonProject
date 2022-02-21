-- Q6
create or replace view Q6(subject, nOfferings)
as
select subjects.code || ' '|| subjects.name as subject,
count(courses.id) as nOfferings
from courses, subjects
where courses.subject=subjects.id
and courses.subject not in
(
select distinct subjects.id
from subjects, courses, coursestaff
where subjects.id=courses.subject
and courses.id=coursestaff.course
group by subjects.id
having count(coursestaff.staff)>0
)
group by subjects.id,subjects.code,subjects.name
having count(courses.id)>30
order by subject;

-- Q7
create or replace function
	Q7(text) returns setof FacilityRecord
as $$
select rooms.longname, facilities.description
from facilities, roomfacilities, rooms
where facilities.id=roomfacilities.facility
and roomfacilities.room=rooms.id
and upper(facilities.description) ~ upper($1)
$$ language sql
;

-- Q8
create or replace view q8_1
as
select
t2.id, t2.year,t2.sess, t2.starting, t2.ending, t2.starting-7 as before_7,
(
select max(t1.ending)
from terms t1 where t1.starting<t2.starting
) last_ending,
(
select min(t3.starting)
from terms t3 where t3.starting>t2.starting
) next_starting
from terms t2
order by t2.starting;

create or replace view q8_2
as
select
t1.*,
case when next_starting-ending<7 then last_ending+1
else before_7 end as efct_starting
from q8_1 t1;

create or replace view q8_3
as
select
t2.*,
(
select min(t1.efct_starting)-1
from q8_2 t1 where t1.efct_starting>t2.efct_starting
) as efct_ending
from q8_2 t2;

create or replace function Q8(_day date) returns text
as $$
declare
term text;
begin
select substr(year::text,3,2)||lower(sess) into term
from
q8_3
where _day >=efct_starting and _day<=efct_ending;
return term;
end;
$$ language plpgsql
;

-- Q9
create or replace function Q9(_sid integer)
 RETURNS SETOF transcriptrecord
 LANGUAGE plpgsql
as $function$
declare
	rec TranscriptRecord;
	UOCtotal integer := 0;
	UOCpassed integer := 0;
	wsum integer := 0;
	wam integer := 0;
	x integer;
begin
	select s.id into x
	from   Students s join People p on (s.id = p.id)
	where  p.unswid = _sid;
	if (not found) then
		raise exception 'Invalid student %',_sid;
	end if;
	for rec in
		select su.code, substr(t.year::text,3,2)||lower(t.sess),
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
				UOCpassed := UOCpassed + rec.uoc;
			end if;
			UOCtotal := UOCtotal + rec.uoc;
			-- weighted sum based on mark and uoc for course
			wsum := wsum + (rec.mark * rec.uoc);
		end if;
		return next rec;
	end loop;

	for rec in
	    select
	    subjects.code,
	    null term,
	    case when lower(variations.vtype)='exemption' then 'Exemption, based on ...'
	    when lower(variations.vtype)='advstanding' then 'Advanced standing, based on ...'
	    when lower(variations.vtype)='substitution' then 'Substitution, based on ...'
	    end as name,
	    null mark,
	    null grade,
	    (case when lower(variations.vtype)='advstanding' then subjects.uoc else null end ) uoc
	    from
	    subjects, students, people, variations
	    where subjects.id=variations.subject
	    and variations.student=students.id
	    and students.id=people.id
	    and people.unswid=_sid
	loop
		  if rec.uoc is not null then
             UOCpassed := UOCpassed + rec.uoc;
           end if;
          return next rec;
	end loop;

	for rec in
        select
        null code,
        null term,
        case when variations.intequiv is not null
        and lower(variations.vtype)='substitution' then 'studying'||' '||subjects.code||' at UNSW'
	    end as name,
        null mark,
        null grade,
        null uoc
        from
        subjects, students, people, variations
	    where subjects.id=variations.intequiv
	    and variations.student=students.id
	    and students.id=people.id
		and people.unswid=_sid

        union
	    select
        null code,
	    null term,
	    case when lower(variations.vtype)='exemption' then 'study at'||' '||externalsubjects.institution
	    when lower(variations.vtype)='advstanding' then 'study at'||' '||externalsubjects.institution
	    when lower(variations.vtype)='substitution' then 'studying'||' '||subjects.code||' at UNSW'
	    end as name,
	    null mark,
	    null grade,
	    null uoc
	    from
	    subjects, students, people, variations,externalsubjects
	    where subjects.id=externalsubjects.equivto and variations.extequiv is not null
	    and variations.extequiv=externalsubjects.id
	    and variations.student=students.id
	    and students.id=people.id
		and people.unswid=_sid
        order by term,code
	loop
	      if rec.uoc is not null then
             UOCpassed := UOCpassed + rec.uoc;
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
$function$;




