# COMP3311 21T3 Ass2 ... Python helper functions
# add here any functions to share between Python scripts
# you must submit this even if you add nothing

def getProgram(db,code):
  cur = db.cursor()
  cur.execute("select * from Programs where code = %s",[code])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getStream(db,code):
  cur = db.cursor()
  cur.execute("select * from Streams where code = %s",[code])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getStudent(db,zid):
  cur = db.cursor()
  qry = """
  select p.*, c.name
  from   People p
         join Students s on s.id = p.id
         join Countries c on p.origin = c.id
  where  p.id = %s
  """
  cur.execute(qry,[zid])
  info = cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getSubject(db, code):
  cur=db.cursor()
  query="select * from subjects where code='"+code+"'"
  cur.execute(query)
  info=cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info

def getLatestProgStrm(db, sid):
  cur=db.cursor()
  query="""
  select pe.program,  p.name, s.code, s.name
  from program_enrolments pe join terms t on pe.term=t.id
  join stream_enrolments se on se.partof=pe.id
  join streams s on se.stream=s.id
  join programs p on pe.program=p.id
  where pe.student= %s
  and t.starting=(
    select max(t1.starting)
    from program_enrolments pe1 join terms t1 on pe1.term=t1.id
    where pe1.student= %s
    )
  """
  cur.execute(query,[sid,sid])
  info=cur.fetchone()
  cur.close()
  if not info:
    return None
  else:
    return info


def getStuCourse(db,sid,sj):
  cur = db.cursor()
  query="""
  select s.code, t.code,s.name, ce.mark, ce.grade, s.uoc
  from subjects s join courses c on c.subject=s.id
  join course_enrolments ce on ce.course=c.id
  join terms t on t.id=c.term
  where s.code=%s
  and ce.student=%s
  """
  cur.execute(query,[sj,sid])
  info=cur.fetchall()
  cur.close()
  if not info:
    return None
  else:
    return info


def getProgStrm(db, pcode, scode):
  cur = db.cursor()
  query="""
  select * from fn_q3(%s,%s)
  """
  cur.execute(query,[pcode,scode])
  info=cur.fetchall()
  cur.close()
  if not info:
    return None
  else:
    return info


# def completedProgStrm(db, sid, pcode, scode):
#   cur = db.cursor()
#   query="""select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
#     from
#     (
#     select
#     code,strm_prog, rule_name, defby, min_req,max_req, type, rule_order, regexp_split_to_table(definition,',') as definition
#     from (select * from fn_q3(%s,%s)) vv1
#     where vv1.defby='enumerated'
#     order by strm_prog
#     ) tv
#     left join subjects s on tv.definition like '%'||s.code||'%'
#     left join courses c on c.subject=s.id
#     left join course_enrolments ce on ce.course=c.id
#     left join terms t on t.id=c.term
#     where ce.student=%s
#
#     union
#     select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
#     from
#     (
#     select
#     code,strm_prog, rule_name, defby, min_req,max_req, type, rule_order, regexp_split_to_table(definition,',') as definition
#     from (select * from fn_q3(%s,%s)) vv1
#     where vv1.defby='pattern'
#     order by strm_prog
#     ) tv
#     left join subjects s on s.code like replace(tv.definition,'#','')||'%'
#     left join courses c on c.subject=s.id
#     left join course_enrolments ce on ce.course=c.id
#     left join terms t on t.id=c.term
#     where ce.student=%s
#
#     union
#     select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
#     from
#     (
#     select
#     code,strm_prog, rule_name, defby, min_req,max_req, type, rule_order,regexp_split_to_table(definition,',') as definition
#     from (select * from fn_q3(%s,%s)) vv1
#     where vv1.defby='pattern'
#     order by strm_prog
#     ) tv,
#     subjects s
#     join courses c on c.subject=s.id
#     join course_enrolments ce on ce.course=c.id
#     join terms t on t.id=c.term
#     where ce.student=%s and tv.definition like 'FREE%'
#     order by starting, subject, rule_order
#     """
#   cur.execute(query, [pcode, scode,sid,pcode, scode,sid,pcode, scode,sid,])
#   info=cur.fetchall()
#   cur.close()
#   if not info:
#     return None
#   else:
#     return info


def completedProgStrm(db, sid, pcode, scode):
  cur = db.cursor()
  query = """select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
    from
    (
    select
    code,strm_prog,rid, rule_name, defby, min_req,max_req, type, rule_order, regexp_split_to_table(definition,',') as definition
    from (select * from fn_q3('{}','{}')) vv1
    where vv1.defby='enumerated'
    order by strm_prog
    ) tv
    left join subjects s on tv.definition like '%'||s.code||'%'
    left join courses c on c.subject=s.id
    left join course_enrolments ce on ce.course=c.id
    left join terms t on t.id=c.term
    where ce.student='{}'
    union
    select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
    from
    (
    select
    code,strm_prog,rid, rule_name, defby, min_req,max_req, type, rule_order, regexp_split_to_table(definition,',') as definition
    from (select * from fn_q3('{}','{}')) vv1
    where vv1.defby='pattern'
    order by strm_prog
    ) tv
    left join subjects s on s.code like replace(tv.definition,'#','')||'%'
    left join courses c on c.subject=s.id
    left join course_enrolments ce on ce.course=c.id
    left join terms t on t.id=c.term
    where ce.student='{}'

    union
    select tv.*, s.code as subject, s.name, ce.mark,ce.grade,s.uoc,t.code as term, t.starting
    from
    (
    select
    code,strm_prog,rid, rule_name, defby, min_req,max_req, type, rule_order,regexp_split_to_table(definition,',') as definition
    from (select * from fn_q3('{}','{}')) vv1
    where vv1.defby='pattern'
    order by strm_prog
    ) tv,
    subjects s
    join courses c on c.subject=s.id
    join course_enrolments ce on ce.course=c.id
    join terms t on t.id=c.term
    where ce.student='{}' and tv.definition like 'FREE%'
    order by starting, subject, rule_order, rid
    """


  # print(query)
  cur.execute(query.format(pcode,scode,sid,pcode,scode,sid,pcode,scode,sid))
  info = cur.fetchall()
  cur.close()
  if not info:
    return None
  else:
    return info

def neededCC(db,pcode,scode):
  cur = db.cursor()
  query="""select t.*,s.code as subject,  s.name
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

         from (select * from fn_q3('{}', '{}')) vv1
         where vv1.defby = 'enumerated'
         order by strm_prog, rid
     ) t
join subjects s on t.definition like '%'||s.code||'%' order by rule_order, t.strm_prog,rid;
  """
  # print(query)
  cur.execute(query.format(pcode,scode))
  info = cur.fetchall()
  cur.close()
  if not info:
    return None
  else:
    return info