

i.	Get distinct project numbers of projects in which employees work. The results should be ordered by project number.


for $x in doc("Q3-company.xml")/companyDB/employees/employee/projects
order by $x/worksOn/@pno
return $x/worksOn

for $x in doc("Q3-company.xml")/companyDB/projects/project
order by $x/@pnumber
return <pnum>{$x/@pnumber}</pnum>



ii.	Create a view that has the department name, manager name, and manager salary for every department.

for $x in doc("Q3-company.xml")/companyDB/departments/department
return $x/dname

for $x in doc("Q3-company.xml")/companyDB/departments/department
return
    <department_view>
        {$x/dname}
        {for $c in doc("Q3-company.xml")/companyDB/employees/employee[@ssn=$x/manager/@mssn]
        return
        <manager>{$c/fname}{$c/lname}{$c/salary}</manager>
        }
    </department_view>

iii.	A view that has the employee name, supervisor name, and employee salary for each employee who works in the ‘Research’ department.


for $x in doc("Q3-company.xml")/companyDB/departments/department
where $x/dname="Research"
return $x/employees

for $e in doc("Q3-company.xml")/companyDB/employees/employee
return
<view-3>
    <employee_name>{$e/fname}{$e/lname}</employee_name>
    {
    for $d in doc("Q3-company.xml")/companyDB/departments/department[@dno=$e/@worksFor]
    where $d/dname="Research"
    return $d/dname
    }
    {
    for $s in doc("Q3-company.xml")/companyDB/employees/employee[@ssn=$e/@supervisor]
    return
    <supervisor>{$s/fname}{$s/lname}</supervisor>
    }
    {
    $e/salary
    }
</view-3>

iv.	A view that has the project name, controlling department name, number of employees, and total hours worked per week on the project for each project.

for $p in doc("Q3-company.xml")/companyDB/projects/project
return
    <view-4>
    {$p/pname}
    {
     for $d in doc("Q3-company.xml")/companyDB/departments/department[@dno=$p/@controllingDepartment]
     return $d/dname
    }
    <num_of_employees>
    {
    fn:count(
    for $e in doc("Q3-company.xml")/companyDB/employees/employee[@ssn=$p/workers/worker/@essn]
    return $e
    )}
    </num_of_employees>
    <total_hours>
      {
    fn:sum(
    for $w in doc("Q3-company.xml")/companyDB/projects/project[pname=$p/pname]
    return $w/workers/worker
    )}
    </total_hours>
    </view-4>

v.	A view that has the project name, controlling department name, number of employees, and total hours worked per week on the project for each project with more than one employee working on it.

for $p in doc("Q3-company.xml")/companyDB/projects/project
return
    <view-5>
    {$p/pname}
    {
     for $d in doc("Q3-company.xml")/companyDB/departments/department[@dno=$p/@controllingDepartment]
     return $d/dname
    }
    <num_of_employees>
    {
    fn:count(
    for $e in doc("Q3-company.xml")/companyDB/employees/employee[@ssn=$p/workers/worker/@essn]
    return $e
    )}
    </num_of_employees>
    <total_hours>
      {
    fn:sum(
    for $w in doc("Q3-company.xml")/companyDB/projects/project[pname=$p/pname]
    return $w/workers/worker
    )}
    </total_hours>
    </view-5>