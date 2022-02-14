select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
from
(
select
code,strm_prog, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition
from vv3
where vv3.defby='enumerated'
order by strm_prog
) tv
left join subjects s on tv.definition like '%'||s.code||'%'
left join courses c on c.subject=s.id
left join course_enrolments ce on ce.course=c.id
left join terms t on t.id=c.term
where ce.student=5198386

union
select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
from
(
select
code,strm_prog, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition
from vv3
where vv3.defby='pattern'
order by strm_prog
) tv
left join subjects s on s.code like replace(tv.definition,'#','')||'%'
left join courses c on c.subject=s.id
left join course_enrolments ce on ce.course=c.id
left join terms t on t.id=c.term
where ce.student=5198386
order by starting, subject, defby;



select t.*,s.code as subject,  s.name
from (
         select vv1.code,
                strm_prog,
                rid,
                rule_name,
                defby,
                min_req,
                max_req,
                type,
                rule_order,
                regexp_split_to_table(definition, ',') as definition

         from (select * from fn_q3(3778, 'COMPA1')) vv1
         where vv1.defby = 'enumerated'
         order by strm_prog, rid
     ) t
join subjects s on t.definition like '%'||s.code||'%' order by rule_order, t.strm_prog, s.code,rid;