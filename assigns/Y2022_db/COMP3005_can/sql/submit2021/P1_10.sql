/*
Problem 1.10 Produce a table that lists the name of all the service-subscribers that subscribe to at least all the same services as Jason Allison subscribes to but possibly others as well. Jason Allison rents the line with portID=2. (So this is the classic "subset" query.)
*/


select t1.name
from
(
select s.name,count(t.scode) as count
from subscribers s
join facilities f on s.portid=f.portid
join service_subscribers ss on ss.portid=f.portid
join
(
select ser.scode
from subscribers s join facilities f on s.portid=f.portid
join service_subscribers ss on ss.portid=f.portid
join services ser on ser.scode=ss.service
where s.name='Jason Allison'
group by ser.scode
) t on ss.service=t.scode
group by s.name
) t1,
(
select distinct s.name
from subscribers s
join facilities f on s.portid=f.portid
join service_subscribers ss on ss.portid=f.portid
join
(
select ser.scode
from subscribers s join facilities f on s.portid=f.portid
join service_subscribers ss on ss.portid=f.portid
join services ser on ser.scode=ss.service
where s.name='Jason Allison'
) tt on ss.service=tt.scode
) t2,
(
select count(ser.scode) as count
from subscribers s join facilities f on s.portid=f.portid
join service_subscribers ss on ss.portid=f.portid
join services ser on ser.scode=ss.service
where s.name='Jason Allison'
) t3
where t1.name=t2.name and t1.count=t3.count;



/*
Test Output:

name
-------------
Homer Simpson
Jason Allison
Joe Carter
Matt Stajan
Michael Jorda
*/