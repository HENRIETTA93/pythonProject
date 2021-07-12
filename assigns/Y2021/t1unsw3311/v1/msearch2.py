import sqlite3, sys

if len(sys.argv) < 2:
    print("Usage:", sys.argv[0], "SUBSTRING")
    sys.exit(1)


params=[]
for i in range(0,len(sys.argv)):
    params.append(sys.argv[i])
    # print(params[i])


con = sqlite3.connect('D:\\02Coding\\Pycharm\\assigns\\unsw3311\\a2.db')
cur = con.cursor()
# sql = "select title, year from movie where year={} order by title"
# cur.execute(sql)

sql_begin="select distinct movie.id " \
    "from movie " \
    "left join director on movie.director_id=director.id " \
    "left join acting on movie.id=acting.movie_id " \
    "left join actor on actor.id=acting.actor_id "
sql_where="where "
sql_param="lower(movie.title) like '%"+params[1]+"%' or lower(actor.name) like '%"+params[1]+"%' or lower(director.name) like '%"+params[1]+"%'"
# print(sql_param)
sql=sql_begin+sql_where+sql_param
print(sql)
cur.execute(sql)

movieids=cur.fetchall()
print(movieids)
movies=[]
for id in movieids:
    print((id))
    movies.append(str(id))

print(movies)
sql2="select distinct movie.title, movie.year, movie.content_rating, rating.imdb_score " \
     "from movie left join rating on rating.movie_id=movie.id " \
     "where movie.id in {} " \
     "order by movie.year desc, rating.imdb_score desc, movie.title"

cur.execute(sql2.format(movieids))
while True:
    t = cur.fetchone()
    if t == None:
        break
    print(t)
con.close()



# select movie.title, movie.year, movie.content_rating, rating.imdb_score
# from movie join rating on rating.movie_id=movie.id
# join director on movie.director_id=director.id
# join acting on movie.id=acting.movie_id
# join actor on actor.id=acting.actor_id
# where lower(movie.title) like 'james franco'
# or lower(actor.name) like 'james franco'
# or lower(director.name) like 'james franco'
# order by movie.year desc, rating.imdb_score desc, movie.title;