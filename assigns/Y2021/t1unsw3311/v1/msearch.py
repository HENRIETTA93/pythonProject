import sqlite3, sys

t=(1,3)
t=t+tuple("900f")
print(t)
list(t)
print(t)
if len(sys.argv) < 2:
    print("Usage:", sys.argv[0], "SUBSTRING")
    sys.exit(1)

params=[]
for i in range(0,len(sys.argv)):
    params.append(sys.argv[i])
    # print(params[i])

con = sqlite3.connect('a2.db')
cur = con.cursor()


sql_begin="select distinct movie.id " \
    "from movie " \
    "left join director on movie.director_id=director.id " \
    "left join acting on movie.id=acting.movie_id " \
    "left join actor on actor.id=acting.actor_id "
sql_where="where "
sql_inter="intersect "
sql_param="lower(movie.title) like '%"+params[1]+"%' or lower(actor.name) like '%"+params[1]+"%' or lower(director.name) like '%"+params[1]+"%'"
# print(sql_param)
sql1=sql_begin+sql_where+sql_param
# print(sql1)
cur.execute(sql1)

sql_params=[]
for param in params[1:]:
    sql_param="lower(movie.title) like '%"+param+"%' or lower(actor.name) like '%"+param+"%' or lower(director.name) like '%"+param+"%' "
    sql_params.append(sql_param)

sql=sql_begin+sql_where+sql_params[0]


for sql_param in sql_params[1:]:
    sql=sql+sql_inter+sql_begin+sql_where+sql_param
# print(sql)

cur.execute(sql)

movieids=cur.fetchall()
# print(movieids)

if movieids is None or len(movieids)==0:
    sys.exit(1)
movies="("
for id in movieids:
    # print(id[0])
    movies=movies+str(id[0])+","
movies=movies[0:len(movies)-1]
movies=movies+")"
# print(movies)
sql2="select distinct movie.id, movie.title, movie.year, movie.content_rating, rating.imdb_score " \
     "from movie left join rating on rating.movie_id=movie.id " \
     "where movie.id in "+movies +" order by movie.year desc, rating.imdb_score desc, movie.title"
# print(sql2)

sql3="select genre from genre where movie_id={} order by genre"
cur.execute(sql2)

curr=con.cursor()
index=1
while True:
    t = cur.fetchone()
    if t == None:
        break
    movieid=t[0]
    curr.execute(sql3.format(movieid))
    genres=curr.fetchall()
    genreslist="["
    for genre in genres:
        genreslist+=genre[0]+","
    genreslist=genreslist[0:len(genreslist)-1]
    genreslist+="]"
    if t[2] is None:
        print(str(index) + ".", t[1], "(" + str(t[3]) + ", " + "{:.1f}".format(float(t[4])) + ")", genreslist)
    elif t[3] is None:
        print(str(index) + ".", t[1], "(" + str(t[2]) + ", " + "{:.1f}".format(float(t[4])) + ")", genreslist)
    elif t[4] is None:
        print(str(index) + ".", t[1], "(" + str(t[2]) + ", " + str(t[3]) + ")", genreslist)
    else:
        print(str(index) + ".", t[1], "(" + str(t[2]) + ", " + str(t[3]) + ", " + "{:.1f}".format(float(t[4])) + ")", genreslist)

    index+=1

con.close()



