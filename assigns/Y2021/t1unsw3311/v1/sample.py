import sqlite3, sys

if len(sys.argv) != 2:
    print("Usage:", sys.argv[0], "YEAR")
    sys.exit(1)
year = sys.argv[1]
con = sqlite3.connect('a2.db')
cur = con.cursor()
sql = "select title, year from movie where year={} order by title"
cur.execute(sql.format(year))

ts=cur.fetchall()
print(ts)
while True:
    t = cur.fetchone()
    if t == None:
        break
    x,y=t
    print('{}({})'.format(x,y))
con.close()
