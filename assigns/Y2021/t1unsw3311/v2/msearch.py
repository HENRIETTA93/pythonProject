import sqlite3, sys

if len(sys.argv) < 2:
    print("Usage:", sys.argv[0], "SUBSTRING-1 SUBSTRING-2 SUBSTRING-3...")
    sys.exit(1)

searchParams = []

for pi in range(1, len(sys.argv)):
    searchParams.append(sys.argv[pi])
    pi = pi + 1
# print(searchParams)

con = sqlite3.connect('a2.db')

cur = con.cursor()

sql1 = """select movie.id, movie.title, movie.year, movie.content_rating, rating.imdb_score
        from movie
        left join acting on acting.movie_id=movie.id
        left join actor on actor.id = acting.actor_id
        left join director on movie.director_id=director.id
        left join rating on  movie.id =rating.movie_id 
        where movie.title like '%{}%' or actor.name like '%{}%' or director.name like '%{}%'
        group by movie.id, movie.title
        """
sql2 = " intersect "

sql3 = " order by movie.year desc, rating.imdb_score desc, movie.title"

sql = ""
if len(searchParams) == 1:
    sql = (sql1+sql3).format(searchParams[0], searchParams[0], searchParams[0])
elif len(searchParams) > 1:
    sql = sql + sql1
    sql = sql.format(searchParams[0], searchParams[0], searchParams[0])
    for param in searchParams[1:]:
        sql = sql + sql2 + sql1
        sql = sql.format(param, param, param)
    sql = sql + sql3

# print(sql)

cur.execute(sql)

results=cur.fetchall()

sqlgenre=" select genre from genre where movie_id={} order by genre "
ri=1
for result in results:
    rmid=result[0]
    rtitle=result[1]
    ryear=result[2]
    rrating=result[3]
    rscore=result[4]
    cur.execute(sqlgenre.format(rmid))
    genres=cur.fetchall()
    genreslist="["
    for genre in genres:
        genreslist=genreslist+genre[0]+","
    genreslist=genreslist[:-1]+"]"

    if ryear is None:
        print("{}. {} ({}, {:.1f}) {}".format(ri, rtitle, rrating, float(rscore), genreslist))
    elif rrating is None:
        print("{}. {} ({} {:.1f}) {}".format(ri, rtitle, ryear, float(rscore), genreslist))
    elif rscore is None:
        print("{}. {} ({}, {}) {}".format(ri, rtitle, ryear, rrating, genreslist))
    else:
        print("{}. {} ({}, {}, {:.1f}) {}".format(ri, rtitle, ryear, rrating, float(rscore), genreslist))
    ri=ri+1

con.close()