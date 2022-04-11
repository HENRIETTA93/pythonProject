/*
Problem 1.4 Find the names and address of all subscribers who subscribe to all of the available services. (Note the result for the current data might be empty but your query should work if the TA's add more data to the databse.)
*/

select s.name, s.address
from facilities f join subscribers s on f.portid=s.portid
where f.portid in (select portid from service_subscribers group by portid having count(service)=(select count(scode) from services));

/*
Test Output:

*/