str="fadfa"
# print(str.index(";"))

print(str.__contains__(";"))
print(str.count(";"))

#
# create or replace view vv1
# as
#     select * from fn_q3(3707,'COMPBH');
# create or replace view vv2
# as
#     select * from fn_q3(8543,'COMPSS');
# create or replace view vv3
# as
#     select * from fn_q3(3707,'SENGAH');
# create or replace view vv4
# as
#     select * from fn_q3(3778,'COMPA1');
#
#
# create or replace view vv11 as
# select vv1.code,strm_prog, rule_name, defby, min_req,max_req, type,
#        regexp_split_to_table(definition,',') as definition,
#        s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term
# from vv1
# join subjects s on s.code=vv1.definition
# join courses c on c.subject=s.id
# join course_enrolments ce on ce.course=c.id
# join terms t on t.id=c.term
# where ce.student=5197273
# and vv1.defby='enumerated' and char_length(definition)=char_length(s.code) and vv1.type='CC'
# union
# select vv1.code,strm_prog, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition,
#        s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term
# from vv1
# join subjects s on s.code=substring(vv1.definition,2,8) or s.code=substring(vv1.definition,11,8)
# join courses c on c.subject=s.id
# join course_enrolments ce on ce.course=c.id
# join terms t on t.id=c.term
# where ce.student=5197273
# and vv1.defby='enumerated' and char_length(definition)!=char_length(s.code) and vv1.type='CC'
# order by strm_prog, term, subject;
#
#
#
#
# select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term
# from
# (
# select
# code,strm_prog, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition
# from vv1
# where vv1.defby='enumerated' and vv1.type='FE'
# order by strm_prog
# ) tv
# left join subjects s on tv.definition like '%'||s.code||'%'
# left join courses c on c.subject=s.id
# left join course_enrolments ce on ce.course=c.id
# left join terms t on t.id=c.term
# where ce.student=5197273
#
# union
# select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term
# from
# (
# select
# code,strm_prog, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition
# from vv1
# where vv1.defby='pattern' and vv1.type='FE'
# order by strm_prog
# ) tv
# left join subjects s on s.code like replace(tv.definition,'#','')||'%'
# left join courses c on c.subject=s.id
# left join course_enrolments ce on ce.course=c.id
# left join terms t on t.id=c.term
# where ce.student=5197273
# order by strm_prog, term, subject;
#
#
#
#
# select code,strm_prog, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition
# s.code, s.name, c.mark,c.grade,s.uoc,t.code
# from vv1
# join subjects s on s.code=vv1.definition
# join courses c on c.subject=s.id
# join course_enrolments ce on ce.course=c.id
# where ce.student=5197273
# and vv1.defby='enumerated' and len(definition)=len(s.code) and vv1.type='PE'
#
#
# select tv.*,replace(tv.definition,'#','')
# from
# (
# select
# code,strm_prog, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition
# from vv1
# where vv1.defby='pattern' and vv1.type='CC'
# order by strm_prog
# ) tv
