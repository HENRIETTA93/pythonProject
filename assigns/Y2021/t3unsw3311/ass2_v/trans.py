#!/usr/bin/python3
# COMP3311 21T3 Ass2 ... print a transcript for a given student

import sys
import psycopg2
import re
from helpers import getStudent

# define any local helper functions here

### set up some globals

usage = f"Usage: {sys.argv[0]} zID"
db = None

### process command-line args

argc = len(sys.argv)
if argc < 2:
  print(usage)
  exit(1)
zid = sys.argv[1]
if zid[0] == 'z':
  zid = zid[1:8]
digits = re.compile("^\d{7}$")
if not digits.match(zid):
  print(f"Invalid student ID {zid}")
  exit(1)

# manipulate database

try:
  # db = psycopg2.connect("dbname=mymyunsw")
  db=psycopg2.connect("host=192.168.7.100 dbname=mymyunsw user=postgres port=5432 password=1234")
  stuInfo = getStudent(db,zid)
  if not stuInfo:
    print(f"Invalid student ID {zid}")
    exit()

  # print(stuInfo) # debug
  # Print transcript for Student
  # ... add your code here ...

  sid=stuInfo[0]
  sname=stuInfo[1]+", "+stuInfo[2]
  print(sid, sname)

  query="select s.id, sj.code, t.code, sj.name,ce.mark, ce.grade,sj.uoc \
        from students s join course_enrolments ce on s.id=ce.student \
        join courses c on c.id=ce.course \
        join terms t on t.id=c.term \
        join subjects sj on sj.id=c.subject \
        where s.id="+str(sid)+" \
        order by t.code, sj.code"

  cursor = db.cursor()
  cursor.execute(query)
  result=cursor.fetchall()
  # print(result) #debug

  GRADE_NO_UOC=['AF','FL','UF','AS','AW','PW','RD','NF','LE','PE','WD','WJ']
  GRADE_WAM=['HD','DN','CR','PS','AF','FL','UF']
  GRADE_NO_WAM=['A','B','C','D','XE','T','SY','EC','NC','AS','AW','PW','RD','NF','LE','PE','WD','WJ']

  FAIL_GRADE=['AF','FL','UF']
  NOTHING=['AS','AW','PW','RD','NF','LE','PE','WD','WJ']

  total_mark=0
  total_uoc=0
  wam_uoc=0
  for r in result:
    code=r[1]
    term=r[2]
    name=r[3]
    mark=r[4]
    grade=r[5]
    uoc=r[6]
    if grade is None or grade in GRADE_NO_UOC:
      pass
    else:
      total_uoc+=r[6]
    if grade is not None and grade in GRADE_WAM:
      wam_uoc += r[6]
      if mark is not None:
        total_mark += r[4] * r[6]
      # if mark is not None and grade not in GRADE_NO_UOC:
        # total_mark+=r[4]* r[6]
      # if grade not in GRADE_NO_UOC:
      #   wam_uoc+=r[6]

    if grade is None or grade in FAIL_GRADE:
      uoc='fail'
    elif grade in NOTHING:
      uoc=''
    else:
      uoc=str(uoc)+'uoc'
      # uoc=int(uoc)
    if mark is None:
      mark='-'

    print(code, term, '%-31s' % name, '%3s' % mark, '%-2s' % grade, '%6s'%uoc)
    # print(f"{code} {term} {name:<32s}{mark:>3} {grade:2s}  {uoc:2d}uoc")
  print("UOC = {}, WAM = {}/{} = {}".format(total_uoc,total_mark,wam_uoc,round(total_mark/wam_uoc,1)))


except Exception as err:
  print("DB error: ", err)
finally:
  if db:
    db.close()

