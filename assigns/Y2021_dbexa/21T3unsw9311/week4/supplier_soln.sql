Q1. Find the names of suppliers who supply some red part.

select S.sname
from   Suppliers S, Parts P, Catalog C
where  P.colour='red' and C.pid=P.pid and C.sid=S.sid

-- alternatively ...

select sname
from   Suppliers natural join Catalog natural join Parts
where  P.colour='red'


Q2. Find the IDs of suppliers who supply some red or green part

select C.sid
from   Parts P, Catalog C
where  (P.colour='red' or P.colour='green') and C.pid=P.pid

Q3. Find the Ids of suppliers who supply some red part and are based at 21 George Street

select S.sid
from   Suppliers S
where  S.address='21 George Street'
       and S.sid in (select C.sid
                    from   Parts P, Catalog C
                    where  P.colour='red' and P.pid=C.pid
                   )


Q4. Find pairs of IDs such that for some part the supplier with the first ID charges more than the supplier with the second ID.

select C1.sid, C2.sid
from   Catalog C1, Catalog C2
where  C1.pid = C2.pid and C1.sid != C2.sid and C1.cost > C2.cost


Q5. For each supplier, return the maximal and the average cost of the parts they offer.

select sid, max(cost), avg(cost)
from catalog 
group by sid

Q6. List those red parts that cost no more than the average cost of all parts

select P.pid, P.pname
from   Parts P, Catalog C
where  P.pid = C.pid and P.colour = 'red' and C.cost < (select avg(cost) from catalog);

Q7. List the names of those red parts that are offered by at least three suppliers.
-- maybe you do not need Catalog in the outer query.

select P.pname
from   Parts P, Catalog C
where  P.pid = C.pid and P.colour='red'
and P.pid in (select C.pid
            from Catalog C
            group by C.pid
            having count(c.pid) >= 3

Q8. Suppliers that supply only red parts
-- idea: all parts sold by the supplier subtract all red part, is it empty? 

select S.sid
from   Suppliers S
where  not exists ((select C.pid from Catalog C where C.sid=S.sid)
                  except
                   (select P.pid from Parts P where P.color='red')) 

Q9. Suppliers that supply all red parts
-- idea: all red parts subtract all parts sold by the supplier, is it empty? 

select S.sid
from   Suppliers S
where  not exists((select P.pid from Parts P where P.color='red')
                  except
                  (select C.pid from Catalog C where C.sid=S.sid))
