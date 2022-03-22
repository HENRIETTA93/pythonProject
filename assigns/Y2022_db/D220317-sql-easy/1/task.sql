-- task1

create table Emp(
eid int primary key,
ename varchar(20),
age int,
salary float
);

create table Dept(
did int primary key,
budget float,
managerid int,
foreign key (managerid) references Emp(eid)
);

create table Works(
eid int,
did int,
pct_time int,
primary key(eid,did),
foreign key (eid) references Emp(eid),
foreign key (did) references Dept(did)
);

insert into Emp values
(1, 'Jim', 33, 70000.0            ),
(2, 'Zhuo', 33, 70000.0           ),
(3, 'Sid', 33, 70000.0            ),
(4, 'Gusto', 34, 70000.0          ),
(5, 'Andy', 33, 70000.0           ),
(6, 'Mary', 34, 70000.0           ),
(7, 'Mouse', 50, 890000.0         ),
(8, 'Kim', 55, 70000.0            ),
(9, 'Meck', 20, 70000.0           ),
(10, 'Mock', 30, 40000.0          ),
(11, 'Tom', 30, 20000.0           ),
(12, 'Toozy', 40, 80000.0         ),
(13, 'Roro', 54, 90000.0          ),
(14, 'Rara', 34, 780000.0         ),
(15, 'Randy', 34, 40000.0         ),
(16, 'Marry', 45, 80000.0         ),
(17, 'Larry', 32, 35000           ),
(18, 'Jarry', 32, 40000.0         ),
(19, 'Herry', 30, 50000.0         ),
(20, 'Mary', 40, 50000.0          ),
(21, 'MooMoo', 50, 780000.0       ),
(22, 'Giles', 40, 210000.0        ),
(23, 'Deniz',24,    1000000.0     ),
(24, 'Suresh',22,      89000.0    ),
(25, 'Shiva' , 22,     95000.0    ),
(26, 'Airy', 23,     77000.0      ),
(27, 'Kirohashi', 24,      10700.0),
(28, 'Krishna',23,      11000.0   ),
(29, 'Kasi'    , 21,      92000.0 ),
(30, 'Raja', 25,     100000.0     ),
(31, 'Bill', 43, 60000.0          ),
(32, 'Bob', 24, 37000.0           ),
(33, 'Ang', 32, 60000.0           ),
(34, 'Dave', 32, 63000.0          ),
(35, 'Kenneth', 36, 65000.0       ),
(36, 'Henry', 32, 160000.0        ),
(37, 'May', 32, 660000.0          ),
(38, 'Balaji', 22, 90000.0        ),
(39, 'Shiva', 28, 10000.0         ),
(40, 'Meck', 25, 100000.0         ),
(41, 'Lee', 23, 50000.0           ),
(42, 'Brian', 33, 47000.0         ),
(43, 'Michael', 36, 80000.0       ),
(44, 'Lisa', 42, 69000.0          ),
(45, 'Steven', 31, 45000.0        ),
(46, 'Charles', 39, 660000.0      ),
(47, 'Justin', 52, 70000.0        ),
(48, 'Aron', 27, 40000.0          ),
(49, 'Ellen', 20, 60000.0         ),
(50, 'William', 35, 90000.0       ),
(51, 'Bobbie', 23, 580000.0       ),
(52, 'Sonia', 33, 570000.0        ),
(53, 'Cindy', 45, 80000.0         ),
(54, 'Kathy', 42, 69000.0         ),
(55, 'Thai', 31, 45000.0          ),
(56, 'Ding', 32, 760000.0         ),
(57, 'Yang', 52, 70000.0          ),
(58, 'Jack', 30, 40000.0          ),
(59, 'Wang', 40, 60000.0          ),
(60, 'Zhong', 35, 90000.0         );

insert into Dept values
(0, 1000000.0, 7  ),
(1, 750000.0, 59  ),
(2, 800000.0, 19  ),
(3, 7000000.0, 22 ),
(4, 6000000.0, 23 ),
(5, 5000000.0, 22 ),
(6, 2500000.0, 7  ),
(7, 3100000.0, 13 ),
(8, 2000000.0, 38 ),
(9, 3005000.0, 27 ),
(10, 4500000.0, 32);

insert into Works values
(1, 1, 10   ),
(1, 2, 10   ),
(1, 6, 80   ),
(2, 0, 60   ),
(2, 7, 40   ),
(3, 0, 100  ),
(4, 5, 80   ),
(4, 9, 20   ),
(5, 0, 100  ),
(6, 1, 70   ),
(6, 2, 30   ),
(7, 0, 25   ),
(7, 6, 50   ),
(7, 10, 25  ),
(8, 0, 33   ),
(8, 3, 33   ),
(8, 8, 33   ),
(9, 0, 100  ),
(10, 1, 20  ),
(10, 2, 80  ),
(11, 2, 50  ),
(11, 5, 50  ),
(12, 0, 100 ),
(13, 2, 30  ),
(13, 7, 70  ),
(14, 0, 33  ),
(14, 3, 33  ),
(14, 10, 33 ),
(15, 4, 70  ),
(15, 5, 30  ),
(16, 0, 100 ),
(17, 9, 100 ),
(18, 3, 100 ),
(19, 2, 100 ),
(20, 0, 100 ),
(21, 0, 33  ),
(21, 1, 33  ),
(21, 2, 33  ),
(22, 3, 50  ),
(22, 5, 50  ),
(23, 4, 100 ),
(24, 0, 100 ),
(25, 0, 100 ),
(26, 0, 100 ),
(27, 3, 20  ),
(27, 9, 80  ),
(28, 0, 100 ),
(29, 0, 100 ),
(30, 1, 100 ),
(31, 4, 30  ),
(31, 6, 70  ),
(32, 3, 50  ),
(32, 10, 50 ),
(33, 10, 100),
(34, 0, 80  ),
(34, 6, 20  ),
(35, 3, 50  ),
(35, 10, 50 ),
(36, 0, 100 ),
(37, 0, 33  ),
(37, 5, 33  ),
(37, 7, 33  ),
(38, 8, 100 ),
(39, 2, 30  ),
(39, 9, 70  ),
(40, 0, 100 ),
(41, 0, 100 ),
(42, 0, 100 ),
(43, 3, 80  ),
(43, 7, 20  ),
(44, 0, 100 ),
(45, 0, 100 ),
(46, 1, 35  ),
(46, 4, 30  ),
(46, 6, 35  ),
(47, 0, 100 ),
(48, 1, 100 ),
(49, 4, 50  ),
(49, 10, 50 ),
(50, 0, 100 ),
(51, 0, 50  ),
(51, 3, 20  ),
(51, 6, 30  ),
(52, 1, 33  ),
(52, 3, 10  ),
(52, 8, 60  ),
(53, 2, 30  ),
(53, 9, 70  ),
(54, 0, 100 ),
(55, 0, 100 ),
(56, 0, 30  ),
(56, 3, 50  ),
(56, 4, 20  ),
(57, 0, 100 ),
(58, 0, 34  ),
(58, 1, 33  ),
(58, 2, 33  ),
(59, 0, 20  ),
(59, 1, 80  ),
(60, 0, 100 );

-- task2

select e.ename,e.salary
from Emp e
where e.eid in (
select eid
from Works
where did=0
)
and e.eid in (
select eid
from Works
where did=2
);


select e1.ename, e1.age, e1.salary
from Emp e1
join Works w1 on e1.eid=w1.eid
join (
select w.did,min(e.age) as min_age
from Emp e
join Works w on w.eid=e.eid
group by w.did
) t on t.did=w1.did and t.min_age=e1.age;





select e.ename
from Emp e
join Dept d on d.managerid=e.eid
where d.budget=(
select max(budget)
from Dept
);

--select d.*
--from Dept d
--join
--(
--select w.did, avg(e.salary) as avg_salary
--from Emp e
--join Works w on w.eid=e.eid
--group by w.did
--order by avg_salary desc limit 1
--) t on d.did=t.did;

select d.did, d.budget, d.managerid
from Dept d
join Works w on d.did=w.did
join Emp e on e.eid=w.eid
group by d.did, d.budget, d.managerid
having avg(e.salary)=
(
select max(avg_salary) as max_avg
from
(
select w.did, avg(e.salary) as avg_salary
from Emp e
join Works w on w.eid=e.eid
group by w.did
) t
);


select *
from Emp
where salary > some (select e.salary from Emp e
join Dept d on d.managerid=e.eid);