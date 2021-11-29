#!/usr/bin/python3
# COMP3311 20T2 Exam
# Q6: print match reports for a specified team in a given year

import sys
import psycopg2

def getResult(g1,g2):
   if g1 > g2:
      result = "won"
   elif g1 < g2:
      result = "lost"
   else:
      result = "drew"
   return result

db = None
cur = None

if len(sys.argv) < 3:
   print(f"Usage: {sys.argv[0]} TeamName Year")
   exit(1)
team = sys.argv[1]
year = sys.argv[2]
if not year.isnumeric:
   print(f"Invalid year {year}")
start_year = f"{year}-01-01"
end_year = f"{year}-12-31"

qT = "select count(*) from Teams where country = %s"
q6 = """
select *
from   q6
where  (team1 = %s or team2 = %s) and date between %s and %s
order  by date
"""

try:
   # db = psycopg2.connect("dbname=footy")
   db = psycopg2.connect("dbname=footy host=127.0.0.1 port=5433 user=postgres password=psql")

   cur = db.cursor();
   cur.execute(qT, [team])
   tup = cur.fetchone()
   if not tup:
      print(f"No team '{team}'")
      exit(1)
   cur.execute(q6, [team,team,start_year,end_year])
   res = cur.fetchall()
   if len(res) == 0:
      print("No matches")
      exit(1)
   for tup in res:
      where,date,t1,g1,t2,g2 = tup
      if t1 == team:
         result = getResult(g1,g2)
         goals = f"{g1}-{g2}"
         opponent = t2
      else:
         result = getResult(g2,g1)
         goals = f"{g2}-{g1}"
         opponent = t1
      print(f"played {opponent} in {where} on {date} and {result} {goals}")
except psycopg2.Error as err:
	print("DB error: ", err)
finally:
   if db:
      db.close()
   if cur:
       cur.close()