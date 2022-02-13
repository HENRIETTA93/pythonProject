select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
from
(
select
code,strm_prog, rule_name, defby, min_req,max_req, type, rule_order,regexp_split_to_table(definition,',') as definition
from vv2
where vv2.defby='enumerated'
order by strm_prog
) tv
left join subjects s on tv.definition like '%'||s.code||'%'
left join courses c on c.subject=s.id
left join course_enrolments ce on ce.course=c.id
left join terms t on t.id=c.term
where ce.student=5123788

union
select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
from
(
select
code,strm_prog, rule_name, defby, min_req,max_req, type, rule_order, regexp_split_to_table(definition,',') as definition
from vv2
where vv2.defby='pattern'
order by strm_prog
) tv
left join subjects s on s.code like replace(tv.definition,'#','')||'%'
left join courses c on c.subject=s.id
left join course_enrolments ce on ce.course=c.id
left join terms t on t.id=c.term
where ce.student=5123788

union
select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
from
(
select
code,strm_prog, rule_name, defby, min_req,max_req, type, rule_order,regexp_split_to_table(definition,',') as definition
from vv4
where vv4.defby='pattern'
order by strm_prog
) tv,
subjects s
join courses c on c.subject=s.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term
where ce.student=5123788 and tv.definition like 'FREE%'
order by starting, subject, rule_order;


select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
    from
    (
    select
    code,strm_prog, rid,rule_name, defby, min_req,max_req, type, rule_order, regexp_split_to_table(definition,',') as definition
    from (select * from fn_q3('8543','COMPSS')) vv1
    where vv1.defby='enumerated'
    order by strm_prog
    ) tv
    left join subjects s on tv.definition like '%'||s.code||'%'
    left join courses c on c.subject=s.id
    left join course_enrolments ce on ce.course=c.id
    left join terms t on t.id=c.term
    where ce.student='5123788'
    union
    select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
    from
    (
    select
    code,strm_prog, rid,rule_name, defby, min_req,max_req, type, rule_order, regexp_split_to_table(definition,',') as definition
    from (select * from fn_q3('8543','COMPSS')) vv1
    where vv1.defby='pattern'
    order by strm_prog
    ) tv
    left join subjects s on s.code like replace(tv.definition,'#','')||'%'
    left join courses c on c.subject=s.id
    left join course_enrolments ce on ce.course=c.id
    left join terms t on t.id=c.term
    where ce.student='5123788'

    union
    select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
    from
    (
    select
    code,strm_prog,rid, rule_name, defby, min_req,max_req, type, rule_order,regexp_split_to_table(definition,',') as definition
    from (select * from fn_q3('8543','COMPSS')) vv1
    where vv1.defby='pattern'
    order by strm_prog
    ) tv,
    subjects s
    join courses c on c.subject=s.id
    join course_enrolments ce on ce.course=c.id
    join terms t on t.id=c.term
    where ce.student='5123788' and tv.definition like 'FREE%'
    order by starting, subject,strm_prog, rule_order, rid;