-- 1
select subname
from subject
where subname like '%Database%'
order by subname;

-- 2
select quota, count(subno) as number_of_subjects
from subject
where subname like '%Database%'
group by quota
order by quota;

-- 3
select s.subno, max(e.mark) as mmark
from subject s
join enroll e on e.subno=s.subno
join student st on e.sno=st.sno
group by s.subno
having count(st.sno)>=6
order by s.subno;


-- 4
select distinct st.sname, s.subno, e.mark
from  student st, enroll e , subject s
where st.telno is null
order by e.mark, s.subno;
select distinct st.sname, e.subno, e.mark
from student st
left join enroll e on st.sno=e.sno
where st.telno is null
order by e.mark, e.subno;

-- 5
select st.sno, st.sname, st.telno
from student st
join enroll e on e.sno=st.sno
group by st.sno, st.name, st.telno
having avg(e.mark)<60
and count(e.subno)>2;

-- 6

select s.subno, s.subname
from subject s
where s.quota =(select quota from subject where
subno='31434'
)
and s.subno!='31434'
order by s.subno;

-- 7
select s.subno, s.subname, count(st.sno), t.mmark as mark
from subject s
join enroll e on s.subno=e.subno
join
(
select subno, max(mark) as mmark
from enroll
group by subno
) t on s.subno=t.subno
where e.mark =t.mmark
group by s.subno, s.subname, t.mmark;


















