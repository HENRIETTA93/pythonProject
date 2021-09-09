
-- Q11
select author_name, num_pages
from
(
select a.author_name, max(b.num_pages) as num_pages, row_number() over (order by num_pages desc) as rowNumber
from book b join book_author ba on b.book_id=ba.book_id
join author a on ba.author_id=a.author_id
where to_char(b.publication_date,'YYYY')<2000
group by a.author_name
order by num_pages desc
) t where rowNumber=1;

-- 10

select b.book_id, count(ba.author_id) as num_authors
from book b join book_author ba on b.book_id=ba.book_id
group by b.book_id;

-- 9
select co.order_date
from  cust_order co join shipping_method sm
on co.shipping_method_id=sm.method_id
where sm.method_name='express'
and to_char(co.order_date,'MM')>'02' and to_char(co.order_date,'MM')<'12';

-- 8
select title
from book
where num_pages<200;


-- 7
select member_id from members where last_name like 'To%';
索引建在last_name column 上，查询条件应该用last_name 模糊查询，而不是先对last_name字段取子串
-- 6
需要在last_name上建索引
create index lstname_index on customer(last_name);