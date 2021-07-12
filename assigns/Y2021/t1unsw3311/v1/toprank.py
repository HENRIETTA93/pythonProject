import sqlite3, sys

if len(sys.argv) !=3:
    print("Usage:", sys.argv[0], "Genres MinRating")
    sys.exit(1)


param_genres=sys.argv[1]
param_score=sys.argv[2]

con = sqlite3.connect('D:\\02Coding\\Pycharm\\assigns\\unsw3311\\a2.db')
cur = con.cursor()

paramgenlist=param_genres.split("&")

# print(paramgenlist)

sql_query="select distinct movie.id, movie.title, movie.year, movie.content_rating, movie.lang, rating.imdb_score,rating.num_voted_users " \
          "from movie join genre on movie.id=genre.movie_id " \
          "join rating on rating.movie_id=movie.id " \
          "where rating.imdb_score>=" \

sql_genre=" and lower(genre.genre)="
sql_inter=" intersect "
sql_orderby=" order by rating.imdb_score desc, rating.num_voted_users desc"

sql=""
if paramgenlist is None:
    sql=sql+sql_query+param_score
else:
    # print(len(paramgenlist))
    if len(paramgenlist)==1:
        sql=sql+sql_query+param_score
    elif len(paramgenlist)>1:
        sql=sql+sql_query+param_score+sql_genre+"'"+paramgenlist[0].lower()+"'"
        for param in paramgenlist[1:]:
            sql=sql+sql_inter+sql_query+param_score+sql_genre+"'"+param.lower()+"'"


sql=sql+sql_orderby
# print(sql)
cur.execute(sql)


index=1
while True:
    t=cur.fetchone()
    if t == None:
        break
    # print(index,t)

    if t[2] is None and t[3] is not None:
        print(str(index) + ".", t[1], "(" + str(t[3]) + ", " + str(t[4]) + ")","["+str(format(t[5],'.1f'))+", "+str(t[6])+"]")
    elif t[3] is None and t[2] is not None:
        print(str(index) + ".", t[1], "(" + str(t[2]) + ", " + str(t[4]) + ")", "["+str(format(t[5],'.1f'))+", "+str(t[6])+"]")
    elif t[4] is None:
        print(str(index) + ".", t[1], "(" + str(t[2]) + ", " + str(t[3]) + ")", "["+str(format(t[5],'.1f'))+", "+str(t[6])+"]")
    elif t[2] is None and t[3] is None:
        print(str(index) + ".", t[1], "("  + str(t[4]) + ")",
              "[" + str(format(t[5], '.1f')) + ", " + str(t[6]) + "]")
    else:
        print(str(index) + ".", t[1], "(" + str(t[2]) + ", " + str(t[3]) + ", " + str(t[4]) + ")", "["+str(format(t[5],'.1f'))+", "+str(t[6])+"]")

    index+=1