import psycopg2
zid = 5128688
# q1 = '''
# select t.id, t.code, s.code, s.name
# from   course_enrolments e
#        join courses c on e.course = c.id
#        join terms t on c.term = t.id
#        join subjects s on c.subject = s.id
# where  e.student = %s
# order by t.starting,s.code
# '''
#
# try:
#    # db = psycopg2.connect("dbname=mymyunsw")
#    db = psycopg2.connect("host=192.168.7.100 dbname=mymyunsw user=postgres port=5432 password=1234")
#    c = db.cursor()
#    c.execute(q1,[zid])
#    prev = 0
#    for t in c.fetchall():
#       if t[1] != prev:
#          print(t[1])
#       print(t[2],t[3])
#       prev = t[1]
#    c.close()


q1 = '''
select t.id,t.code
from   program_enrolments e
       join terms t on e.term = t.id
where  e.student = %s
order by t.starting
'''
q2 = '''
select s.code, s.name
from   course_enrolments e
       join courses c on e.course = c.id
       join subjects s on c.subject = s.id
where  c.term = %s and e.student = %s
order by s.code
'''

try:
   # db = psycopg2.connect("dbname=mymyunsw")
   db = psycopg2.connect("host=192.168.7.100 dbname=mymyunsw user=postgres port=5432 password=1234")
   c1 = db.cursor()
   c2 = db.cursor()
   c1.execute(q1,[zid])
   for t in c1.fetchall():
      print(t[1])
      c2.execute(q2,[t[0],zid])
      for s in c2.fetchall():
         print(s[0],s[1])
   c2.close()
   c1.close()
except Exception as err:
   print("DB error: ", err)
finally:
   if db:
      db.close()