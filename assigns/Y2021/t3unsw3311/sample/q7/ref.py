#!/usr/bin/python3
# COMP3311 20T2 Final Exam
# Q7: print a specified player's career performance

# and, yes, John was naughty using a query inside a for loop ...

import sys
import psycopg2

db = None
cur = None

if len(sys.argv) < 2:
    print(f"Usage: {sys.argv[0]} PlayerName")
    exit(1)
player = sys.argv[1]

qPlayer = "select id,name from Players where name = %s";
qGames = """
select m.id, m.city, m.playedOn
from   Teams t join Involves i on (i.team=t.id)
       join Matches m on (m.id=i.match)
       join Players p on (t.id=p.memberof)
where  p.id = %s
order  by m.playedOn
"""
qGoals = "select count(*) from Goals where scoredIn = %s and scoredBy = %s"
qTeam = """
select t.country
from   Teams t join Players p on (t.id = p.memberof)
where  p.id = %s
"""

totMatches = 0
totGoals = 0

try:
    db = psycopg2.connect("dbname=footy")
    cur = db.cursor();
    cur.execute(qPlayer, [player])
    res = cur.fetchone()
    if not res:
        print("No such player")
        exit(1)
    pid, name = res
    cur.execute(qGames, [pid])
    for g in cur.fetchall():
        totMatches = totMatches + 1
        mid, city, date = g
        cur.execute(qGoals, [mid, pid])
        ngoals = cur.fetchone()[0];
        totGoals = totGoals + ngoals
        if ngoals == 0:
            continue
        elif ngoals == 1:
            goals = " and scored 1 goal"
        else:
            goals = f" and scored {ngoals} goals"
        print(f"played in {city} on {date}{goals}")
    cur.execute(qTeam, [pid])
    team = cur.fetchone()[0]
    print(f"Summary: played for {team}, {totMatches} matches, {totGoals} goals")
except psycopg2.Error as err:
    print("DB error: ", err)
finally:
    if cur:
        cur.close()
    if db:
        db.close()
