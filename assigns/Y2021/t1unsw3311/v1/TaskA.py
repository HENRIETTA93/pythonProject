import sqlite3, sys

if len(sys.argv) < 2:
    print("Usage:", sys.argv[0], "SUBSTRING-1 [SUBSTRING-2] [SUBSTRING-3]")
    sys.exit(1)
if len(sys.argv)==2:
    search_strings = sys.argv[1]
    tag=1
else:
    tag=2
    list_search_strings=[]
    len=len(sys.argv)
    i=1
    for i in range(1,len):
        list_search_strings.append(sys.argv[i])
        i+=1
    # print(list_search_strings)
con = sqlite3.connect('a2.db')

cur = con.cursor()
cur2=con.cursor()

query = """SELECT movie.id, movie.title, movie.year, movie.content_rating, r.imdb_score
        from movie
        left join rating r on r.movie_id = movie.id 
        left join acting on acting.movie_id=movie.id
        left join actor on actor.id = acting.actor_id
        left join director on director.id = movie.director_id
        where movie.title like '%{}%' or director.name like '%{}%' or actor.name like '%{}%'
        group by movie.title
        order by movie.year DESC, r.imdb_score DESC, movie.title ASC
        """

query1="""
SELECT movie.id, movie.title, movie.year, movie.content_rating, r.imdb_score
        from movie
        left join rating r on r.movie_id = movie.id 
        left join acting on acting.movie_id=movie.id
        left join actor on actor.id = acting.actor_id
        left join director on director.id = movie.director_id
        where movie.title like '%{}%' or director.name like '%{}%' or actor.name like '%{}%'
        group by movie.title
"""
intersect=" intersect "

orderby=" order by movie.year DESC, r.imdb_score DESC, movie.title ASC"
query2=""
# print(query.format(search_strings,search_strings,search_strings))
if tag==1:
    cur.execute(query.format(search_strings,search_strings,search_strings))
elif tag==2:
    for search in list_search_strings:
        query2+=query1.format(search,search,search)+intersect
    query2=query2[0:-11]+orderby
    cur.execute(query2)

query_genre="""SELECT genre from genre where movie_id={}"""
i = 1
while True:
    t = cur.fetchone()
    if t == None:
        break
    movieid, movTitle, movYear, movRating, movScore = t
    movie_result=""
    if movYear is None:
        movie_result=str(i)+'. {} ({}, {:.1f})'.format(movTitle,movRating,movScore)
    elif movRating is None:
        movie_result = str(i) + '. {} ({}, {:.1f})'.format(movTitle, movYear, movScore)
    elif movScore is None:
        movie_result = str(i) + '. {} ({}, {}, {})'.format(movTitle, movYear,movRating)
    else:
        movie_result = str(i) + '. {} ({}, {}, {:.1f})'.format(movTitle, movYear, movRating, movScore)
    # print(movie_result)
    cur2.execute(query_genre.format(movieid))
    genres=cur2.fetchall()
    genres.sort()
    movie_result = movie_result + ' ['
    for gen in genres:
        movie_result+=gen[0]+','
    movie_result=movie_result[0:-1]+']'
    print(movie_result)
    i = i + 1



con.close()