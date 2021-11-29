# COMP3311 20T2 Final Exam
# Q7: print a specified player's career performance
'''
"Bugs Bunny"
'Michael Baumann'
'''
import sys
import psycopg2

# ... put any helper functions here ...

db = None
cur = None

if len(sys.argv) < 2:
    print(f"Usage: {sys.argv[0]} PlayerName")
    exit(1)
player = sys.argv[1]

try:
    db = psycopg2.connect("dbname=footy host=127.0.0.1 port=5433 user=postgres password=psql")
    # ... your code goes here ...
    cursor=db.cursor()

    sql="select * from players where name=%s"
    cursor.execute(sql,[player])
    player_info=cursor.fetchone()

    # print(sql.format(player))

    if player_info is None:
        print("No such player")
        sys.exit(1)
    pid = player_info[0]
    sql2="""
    select p.id, p.name, m.city, m.playedon
from players p join goals g on g.scoredby=p.id
join matches m on m.id=g.scoredin
where p.id=%s
order by playedon
    """
    cursor.execute(sql2,[pid])
    goals_info=cursor.fetchall()
    count = 0
    if goals_info is not None:

        for g in goals_info:
            city=g[2]
            playedon=g[3]
            print("played in",city,"on",playedon,"and scored 1 goal")
            count+=1
    sql2="""
    
select p.id, t.country, count(i.match)
from
players p join teams t  on p.memberof=t.id
join involves i on t.id=i.team
where p.id=%s
group by p.id, t.country;
    """
    cursor.execute(sql2,[pid])
    summary=cursor.fetchone()
    country=summary[1]
    matches=summary[2]
    print("Summary: played for", country+",", matches,"matches,",count,"goals")

except psycopg2.Error as err:
    print("DB error: ", err)
finally:
    if cur:
        cur.close()
    if db:
        db.close()

