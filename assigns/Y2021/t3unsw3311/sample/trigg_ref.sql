/*
Note: This question is asking you to write some PLpgSQL functions. While you have a PostgreSQL server and could test these out, by building a small database of your own, we do not expect you to do this. Simply write the code in the file q9.sql as accurately as you can. Your work will not be tested via PostgreSQL, but will be assessed based on how close your code is to a correct solution.

In the MyMyUNSW database from Assignment 2, courses had evaluations (or ratings) assoaciated with them, which roughly correspond to the average score for the final question on the MyExperience survey. Some students might be interested in selecting/avoiding courses based on their rating. Doing this would require using the data in the following two tables:

Courses(id,subject,term,homepage)
CourseEnrolments(student,course,mark,grade,stueval)
Note that we don't want to consider all courses here since e.g. a course with one student who rates the course 6 would get an unfair rating advantage. To ensure that we have a reasonable statistical basis for ratings, we use the following strategy:

the stueval field gives a rating on a 1..6 scale (1=poor .. 6=excellent)
nS ... the total number of students enrolled in the course
nE ... the number of students who gave an evaluation
avgEval ... the mean of the non-null evaluations (the overall course evaluation)
we consider only courses satisfying   (nS > 10 && (3*nE) > nS)
Writing a query to provide an answer to this results in an expensive computation each time a student wants to find course ratings. It is simpler and more efficient if each Courses tuple already contains values for nS, nE, avgEval. This can be achieved by adding extra fields to the Courses table and using triggers to maintain these fields to be consistent with the records in the CourseEnrolments table. That is, we can modify the Courses table to:

Courses(id,subject,term,homepage,nS,nE,avgEval)
Newly-inserted Courses tuples have nS and nE set to 0, and avgEval set to NULL.

The triggers are defined as follows:

create trigger AddCourseEnrolmentTrigger
after insert on CourseEnrolments
execute procedure fixCoursesOnAddCourseEnrolment();

create trigger DropCourseEnrolmentTrigger
after delete on CourseEnrolments
execute procedure fixCoursesOnDropCourseEnrolment();

create trigger ModCourseEnrolmentTrigger
after update on CourseEnrolments
execute procedure fixCoursesOnModCourseEnrolment();

*/
create function fixCoursesOnAddCourseEnrolment() returns trigger
as $$
declare
	_nS integer;  _nE integer;  _sum integer;  _avg float;
begin
	select nS,nE,avgEval into _nS,_nE,_avg
	from Courses where id=new.course;
	-- add one more student
	_ns := _nS + 1;
	if (new.stuEval is not null) then
		-- got another evaluation
		_nE := _nE + 1;
		if (_nS ≤ 10 or (3*_nE) ≤ _nS) then
			-- added a new student, but still not enough for valid eval
			_avg := null;
		else
			-- compute new evaluation
			select sum(stuEval) into _sum
			from CourseEnrolments where course=new.course;
			_sum := _sum + new.stuEval;
			_avg := _sum::float / _nE;
		end if;
	end if;
	-- update Course record
	update Courses set ns = _nS, nE = _nE, avgEval = _avg
	where id=new.course;
	-- since "after" trigger, return value irrelevant
	return new;
end;
$$
language plpgsql;


create function fixCoursesOnDropCourseEnrolment() returns trigger
as $$
declare
	_nS integer;  _nE integer;  _sum integer;  _avg float;
begin
	select nS,nE,avgEval into _nS,_nE,_avg
	from Courses where id=old.course;
	-- we always add one more student
	_nS := _nS - 1;
	if (old.stuEval is not null) then
		-- lost an evaluation
		_nE := _nE - 1;
		if (_nS ≤ 10 or (3*_nE) ≤ _nS) then
			-- no longer enough for valid eval
			_avg := null;
		else
			-- compute new evaluation
			select sum(stuEval) into _sum
			from CourseEnrolments
			where course=old.course and student<>old.student;
			_avg := _sum::float / _nE;
		end if;
	end if;
	-- update Course record
	update Courses set nS = _nS, nE = _nE, avgEval = _avg
	where id=old.course;
	-- since "after" trigger, return value irrelevant
	return old;
end;
$$
language plpgsql;


create function fixCoursesOnModCourseEnrolment() returns trigger
as $$
declare
	_newEval integer;  _oldEval integer;
	_nE integer;  _nS integer;  _sum integer;  _avg float;
begin
	select nS,nE,avgEval into _nS,_nE,_avg
	from Courses where id=old.course;
	if (old.stuEval is null and new.stuEval is not null) then
		-- update involves adding evaluation
		_nE := _nE + 1;
	end if;
	-- treat NULL as zero for arithmetic
	_oldEval := coalesce(old.stuEval,0);
	_newEval := coalesce(new.stuEval,0);
	if (_oldEval <> _newEval) then
		-- compute new evaluation
		select sum(stuEval) into _sum
		from CourseEnrolments where course=old.course;
		_avg := (_sum - _oldEval + _newEval)::float / _nE;
	end if;
	-- update Course record
	update Courses set nS = _nS, nE = _nE, avgEval = _avg
	where id=old.course;
	-- since "after" trigger, return value irrelevant
	return new;
end;
$$
language plpgsql;