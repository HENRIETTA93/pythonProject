/*
Problem 1.6 Produce a table that lists the most popular service (or services). That is, give the name of the service that has the most subscribers.
*/

select s.service
from services s join service_subscribers ss on s.scode=ss.service
group by scode,s.service
order by count(ss.portid) desc
limit 1;


/*
Test Output:

service
--------------
Message Answer

*/
