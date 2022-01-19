
-- 1. Retrieve the name, city, and grade point average (GPA) of students with a high GPA (greater than or equal to 3.2).

select StdFirstName, StdLastName, StdCity,round(StdGPA,2) as StdGPA from student
where StdGPA>=3.2;


-- 2. List the name, city, and increased salary (increase the salary by 20 percent) of faculty hired after 1996.

select FacFirstName as FirstName, FacLastName as LastName, FacCity as City,
round(FacSalary*1.2,0) as InflatedSalary, DATE_FORMAT(FacHireDate,'%e/%c/%Y')as HireDate
from faculty
where year(FacHireDate)>1996;


-- 3. List the offering number and course number of Year 2006 offerings which had no instructor (faculty) assigned.

select OfferNo, CourseNo
from offering
where OffYear=2006 and FacSSN is null;

-- 4. List the offer number, course number, offer term, offer year and faculty Social Security number (SSN) for offerings scheduled in fall 2005 or spring 2006.

select OfferNo, CourseNo, OffTerm, OffYear, FacSSN
from offering
where OffYear=2006 and OffTerm='SPRING' or OffYear=2005 and OffTerm='FALL';



-- 5. List the offering number, course number, and days of offerings containing the words “finance” or “database” in the course description (regardless of uppercase or lowercase letters) and taught in winter 2006.

select OfferNo, CourseNo, OffDays
from offering
where OffYear=2006 and OffTerm='WINTER'
and CourseNo in (select CourseNo from course where lower(CrsDesc) like '%finance%' or lower(CrsDesc) like '%database%');


-- 6. List the offer number, course number, and full name of the instructor (faculty) of all FINANCE courses (the course number’s prefix is ‘FIN’) offered in winter 2006 taught by professor. Note: professor’s rank is “PROF” in the database.


select OfferNo, CourseNo, concat(faculty.FacFirstName,' ', faculty.FacLastName) as "Instructor Name"
from offering
join faculty on faculty.FacSSN=offering.FacSSN
where OffYear=2006 and OffTerm='WINTER'
and CourseNo like 'FIN%'
and faculty.FacRank='PROF';

-- 7. Summarize the number of offerings by course

select CourseNo, count(OfferNo) as NumOfferings
from offering
group by CourseNo;

-- 8. Summarize the average GPA of upper-division (junior or senior) students by major. Only list the majors with average GPA greater than 3.3.

select StdMajor, round(avg(StdGPA),1) as AvgGPA
from student
where StdClass='SR' or StdClass='JR'
group by StdMajor
having avg(StdGPA)>3.3;



-- 9. Summarize the minimum and maximum GPA of students by major and class.
select  StdMajor as Major, StdClass as Class, round(min(StdGPA),1) as MinGPA, round(max(StdGPA),1) as MaxGPA
from student
group by StdMajor, StdClass;


-- 10. Summarize the number of offerings run in 2006 by offering location.

select OffLocation, count(distinct OfferNo) as 2006OfferCount
from offering
where OffYear=2006
group by OffLocation
order by 2006OfferCount desc;


-- 11. List a faculty Leonard Fibon’s teaching schedule in spring 2006. List the offering number, course number, course description, days, location, and time.

select OfferNo, o.CourseNo, CrsDesc, OffDays, OffLocation,OffTime
from faculty f join offering o on f.FacSSN=o.FacSSN
join course c on c.CourseNo=o.CourseNo
where f.FacFirstName='Leonard' and f.FacLastName='Fibon'
and o.OffTerm='SPRING' and o.OffYear='2006';

-- 12. List a student Candy Kendall’s course schedule in 2005. List the offering number, course number, days, location, time, and instructor’s last name.

select o.OfferNo, CourseNo, OffDays, OffLocation, OffTime, f.FacLastName
from student s join registration r on s.StdSSN=r.StdSSN
join enrollment e on e.RegNo=r.RegNo
join offering o on o.OfferNo=e.OfferNo
join faculty f on f.FacSSN=o.FacSSN
where s.StdFirstName='Candy' and s.StdLastName='Kendall' limit 1 ;



-- 13. List faculty members who have a lower salary than their supervisor. List the faculty member’s name, the faculty member’s salary and the supervisor’s name, the supervisor’s salary.

select Subr.FacFirstName, Subr.FacLastName, Subr.FacSalary, Supr.FacFirstName, Supr.FacLastName, Supr.FacSalary
from faculty Subr join faculty Supr on Subr.FacSupervisor=Supr.FacSSN
where Subr.FacSalary<Supr.FacSalary;




-- 14. List the names of faculty members and the course number for which the faculty member teaches the same course number as his or her supervisor in the same year.

select concat(f1.FacFirstName,' ', f1.FacLastName) as "Faculty Name",o.OffYear as Year, o.CourseNo
from faculty f1 join offering o on f1.FacSSN=o.FacSSN
join faculty f2 on f1.FacSupervisor=f2.FacSSN
join offering o2 on o2.FacSSN=f2.FacSSN
where o.OffYear=o2.OffYear and o.CourseNo=o2.CourseNo ;

-- 15. List the course number, the offering number, and the average GPA of students enrolled. Only include courses offered in spring term in which the average GPA of enrolled students is greater than 3.0.

select CourseNo, offering.OfferNo, round(avg(StdGPA),2) as AvgGPA
from offering join enrollment on offering.OfferNo=enrollment.OfferNo
join registration on registration.RegNo=enrollment.RegNo
join student on student.StdSSN=registration.StdSSN
where offering.OffTerm='SPRING'
group by CourseNo, offering.OfferNo
having round(avg(StdGPA),2)>3.0;


-- 16. For offerings beginning with IS in the associated course number, retrieve the offer number, the course number, the faculty number, and the faculty name. Include an offering in the result even if the faculty is not assigned.

select OfferNo, CourseNo, faculty.FacSSN, FacFirstName,FacLastName
from offering left join faculty on offering.FacSSN=faculty.FacSSN
where CourseNo like 'IS%';



-- 17. Retrieve the Social Security Number (SSN), name (first and last), rank, and salary of faculty who are also students.

select FacSSN as SSN, FacFirstName as FirstName, FacLastName as LastName,  FacRank as "Rank",FacSalary as Salary
from faculty
where FacSSN in (select StdSSN from student);



-- 18. List the Social Security Number (SSN), name and city of faculty who only teach in winter term 2006.

select FacSSN, concat(FacFirstName, ' ', FacLastName) as Name, FacCity
from faculty
where FacSSN in (
select FacSSN
from offering
where OffTerm='WINTER' and OffYear=2006
group by FacSSN
having count(FacSSN)=1
);


-- 19. List the course number, the course description, the number of offerings, and the average enrollment across offerings.

select c.CourseNo, c.CrsDesc, count(distinct o.OfferNo) as NumOfferings, round(count(e.RegNo)/count(distinct o.OfferNo),0) as AvgEnroll
from course c join offering o on c.CourseNo=o.CourseNo
join enrollment e on e.OfferNo=o.OfferNo
group by c.CourseNo, c.CrsDesc;

-- 20. List the name of faculty who teach at least one offering of all of the 2006 information systems (IS) courses and his/her supervisor’s name.

select distinct f1.FacFirstName,f1.FacLastName,
concat(f2.FacFirstName,f2.FacLastName) as Supervisor
from faculty f1 join faculty f2 on f1.FacSupervisor=f2.FacSSN
join offering o on o.FacSSN=f1.FacSSN
join course c on o.CourseNo=c.CourseNo
where o.OffYear=2006
and c.CourseNo like 'IS%'
;
