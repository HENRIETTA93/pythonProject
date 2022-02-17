select * from services;

select * from service_subscribers;
select * from facilities;

select su.address
from services s join service_subscribers ss on s.scode=ss.service
join facilities f on f.portid=ss.portid
join subscribers su on su.portid=f.portid


select * from trunks;

select * from trunk_routes;

select * from trunk_routes
where area=905 and office=238

select *
from calls c join trunks t1 on c.orig=t1.portid
join trunks t2 on c.term=t2.portid


select t.*, c.*
from channels c , trunks t join calls ca on ca.term=t.portid
where c.state='IDLE' and t.portid=c.portid


select distinct t.*, c.*
from channels c , trunks t
where c.state='IDLE' and t.portid=c.portid


select s.service, count(ss.portid)
from service_subscribers ss  join services s on s.scode=ss.service
group by s.service;



select * from trunk_routes where
-- area='905' and office='000'
-- area=905;

 (area='905' and office='238') or (area='905' and office='000') or (area='000' and office='000');