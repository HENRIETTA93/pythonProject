/*
Problem 1.5 Find the names of all the subscribers who subscribe to at least three services.
*/


select s.name
from facilities f join subscribers s on f.portid=s.portid
where f.portid in (select portid from service_subscribers group by portid
having count(service)>=3);


/*
Test Output:

name
--------------
Michael Jordan
Joe Carter
Homer Simpson
Vince Carter
Chris Pronger
Frank Thomas
Steve Sampras
Matt Stajan
*/