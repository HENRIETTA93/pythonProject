drop table if exists employee_skills;
drop table if exists works;
drop table if exists projects;
drop table if exists skills;
drop table if exists employees;
create table employees (
Employee_id  int primary key,
Name varchar(30),
dob date,
ssn varchar(11),
address varchar(50),
job_title char(30)
);

create table projects (
Project_id  int primary key,
Project_name varchar(30),
Start_date  timestamp,
End_date    timestamp,
description  text
);


create table skills (
Skill_id   int primary key,
Skill_name  varchar(30),
description  text
);

create table works(
Employee_id int,
Project_id int,
effective_date date,
term_date date,
primary key (Employee_id,Project_id),
foreign key (Employee_id) references employees(Employee_id),
foreign key (Project_id) references projects(Project_id)
);

create table employee_skills(
Employee_id int,
Skill_id int,
primary key(Employee_id, Skill_id),
foreign key (Employee_id) references employees(Employee_id),
foreign key (Skill_id) references skills(skill_id)
);


--Question 4
--Provide the SQL statement that returns the projectid, projectname, employeename and effective and term dates of employees on the project named "HIPPA Update"

select projects.Project_id,
Project_name,
employees.Name,
works.effective_date,
works.term_date
from projects
join works on projects.Project_id=works.Project_id
join employees on employees.Employee_id=works.Employee_id
where projects.Project_name='HIPPA Update';

--Question 5
--Provide the SQL statement that creates a view called v_NY_Employees. This view, when called, must return the EmployeeID, Title, any projects assigned to that employee and effective and term dates for employees located in new york.
--*
--* Demonstrate how the view may be used to further limit results to projects employees are currently working on (hint: term date will be null)
--*
--* IMPORTANT NOTE: There are two parts to this question. First, you must write the query that creates the view and then you must write the query that uses this view to limit results to projects currently being worked on.

create view v_NY_Employees
as
select employees.Employee_id, employees.job_title,Project_name,
works.effective_date,
works.term_date
from employees
join works on employees.Employee_id=works.Employee_id
join projects on projects.Project_id=works.Project_id
where employees.address='New York';

select * from v_NY_Employees where term_date is null;


--Question 6
--Provide the SQL statement that returns the empolyee title that has the most employees with that title. (Hint: Order descending limt rows to 1)

select job_title
from employees
group by job_title
order by count(Employee_id) desc limit 1;

--Question 7
--Provide the SQL statement that returns the names and number of projects of all employee(s) with the most number of projects
--

select employees.Name, count(works.Project_id) as project_num
from employees
join works on employees.Employee_id=works.Employee_id
group by employees.Name
order by count(works.Project_id) desc limit 1;


--Question 8
--Provide the SQL statement that returns names, title and skills of all employees who are experienced in skills named "R" or "Python" (You may use the "IN" Operator) and are not on any projects (You may use the "NOT IN" Operator).


select employees.Name, job_title, skills.Skill_name
from employees
join employee_skills on employees.Employee_id=employee_skills.Employee_id
join skills on skills.Skill_id=employee_skills.Skill_id
where skills.Skill_name in ('R','Python')
and employees.Employee_id not in (select distinct Employee_id from works);



--Question 9
--Provide the SQL statement that lists employees, their age, and their skill that are not on any projects (HINT: NOT IN OPERATOR)
--Select name, diffdate(yyyy, dob, getdate()) as age,

select employees.Name, extract(year from now()-dob) as age, skills.Skill_name
from employees
join employee_skills on employees.Employee_id=employee_skills.Employee_id
join skills on skills.Skill_id=employee_skills.Skill_id
where employees.Employee_id not in (select distinct Employee_id from works);


--Question 10
--Write a table function named 'skills_needed_for' that returns all skills associated with employees for the given project name. The function should not return a table with employees, just the project name and skills.
--
create or replace function skills_needed_for(projectname varchar(30)) returns text
as $$
declare
project_skills text;
begin
select distinct projects.Project_name ||','|| skills.Skill_name into project_skills
from employees
join works on employees.Employee_id=works.Employee_id
join projects on projects.Project_id=works.Project_id
join employee_skills on employee_skills.Employee_id=employees.Employee_id
join skills on skills.Skill_id=employee_skills.Skill_id
where projects.Project_name=projectname;
return project_skills;
end;
$$ language plpgsql
;


--Question 11
--Write a query that uses the table function created above in the question-10.

select skills_needed_for('HIPPA Update');