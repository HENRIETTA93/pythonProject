/*
Problem 1.3 List the names of all the subscribers who are originators of a call to someone who is also a subscriber on the same switch (i.e. a line to line call)
*/

select name
from calls c join facilities f on c.orig=f.portid
join lines l1 on l1.portid=f.portid
join lines l2 on l2.portid=f.portid
join subscribers s on s.portid=f.portid
where f.facility_type='LINE'
and l1.areacode=l2.areacode;

/*
Test Output:

name
-----------
Mats Sundin
Jason Allis
Homer Simps
Michael Jor
Ed Belfour
Jack Morris
Mario Lemie
Vince Carte
Bryan MacCa
Homer Simps
Eric Staal
*/