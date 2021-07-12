import sqlite3,sys

if len(sys.argv) != 3:
 print("Usage: ./shortest actor1 actor2")
 sys.exit(1)

con=sqlite3.connect('a2.db')

cur=con.cursor()

actor1=sys.argv[1].lower()
actor2=sys.argv[2].lower()

def find_one(actorid1, actorid2):
    sql1="select movie_id from acting where actor_id={}"
    sql2=" intersect "
    sql=sql1.format(actorid1)+sql2+sql1.format(actorid2)
    cur.execute(sql)
    finds=cur.fetchall()
    finds_movies=[]
    if len(finds)>0:
        for find in finds:
            finds_movies.append(find[0])
    return finds_movies

def find_two(actorid1, actorid2):
    results=[]
    sql1="select movie_id from acting where actor_id='{}'"
    sql2=" intersect "
    sql3="select actor_id from acting where movie_id='{}'"
    cur.execute(sql1.format(actorid1))
    movids=cur.fetchall()
    if movids!=None:
        for moid in movids:
            cur.execute(sql3.format(moid[0]))
            mactorids=cur.fetchall()
            for maid in mactorids:
                cur.execute(sql1.format(maid[0])+sql2+sql1.format(actorid2))
                relation_movieids=cur.fetchall()
                if relation_movieids !=None:
                    for rm in relation_movieids:
                        results.append((moid[0], maid[0], rm[0]))
    return results

def find_six(actorid1, actorid2):
    results=[]
    sql1 = "select movie_id from acting where actor_id='{}'"
    sql2 = " intersect "
    sql3 = "select actor_id from acting where movie_id='{}'"
    cur.execute(sql1.format(actorid1))
    movids1=cur.fetchall()
    if movids1!=None:
        for mv1 in movids1:
            cur.execute(sql3.format(mv1[0]))
            actids2=cur.fetchall()
            for ac2 in actids2:
                cur.execute(sql1.format(ac2[0]))
                movids2=cur.fetchall()
                for mv2 in movids2:
                    cur.execute(sql3.format(mv2[0]))
                    actids3=cur.fetchall()
                    for ac3 in actids3:
                        cur.execute(sql1.format(ac3[0]))
                        movids3=cur.fetchall()
                        for mv3 in movids3:
                            cur.execute(sql3.format(mv3[0]))
                            actids4=cur.fetchall()
                            for ac4 in actids4:
                                cur.execute(sql1.format(ac4[0]))
                                movids4=cur.fetchall()
                                for mv4 in movids4:
                                    cur.execute(sql3.format(mv4[0]))
                                    actids5=cur.fetchall()
                                    for ac5 in actids5:
                                        cur.execute(sql1.format(ac5[0])+sql2+sql1.format(actorid2))
                                        movids5=cur.fetchall()
                                        if movids5!=None and len(movids5)!=0:
                                            for mv5 in movids5:
                                                results.append((mv1[0], ac2[0], mv2[0], ac3[0],mv3[0],ac4[0], mv4[0],ac5[0],mv5[0]))



def find_actorname(actorid):
    sql="select name from actor where id={}"
    cur.execute(sql.format(actorid))
    return cur.fetchone()[0]

def find_movie(movieid):
    sql="select title, year from movie where id={}"
    cur.execute(sql.format(movieid))
    return cur.fetchone()

sql="select id from actor where lower(name)='{}'"

cur.execute(sql.format(actor1))
actorid1t=cur.fetchone()
if actorid1t is None:
    sys.exit(1)
actorid1=actorid1t[0]
cur.execute(sql.format(actor2))
actorid2t=cur.fetchone()
if actorid2t is None:
    sys.exit()
actorid2=actorid2t[0]

finds=find_one(actorid1, actorid2)
# print(finds)
finds_results=[]
if finds !=None and len(finds)!=0:
    for f in finds:
        movie=find_movie(f)
        result=find_actorname(actorid1)+" was in "+movie[0]+" ("+str(movie[1])+") "+"with "+find_actorname(actorid2)
        finds_results.append(result)

    finds_results.sort()
    for i in range(len(finds_results)):
        print(str(i+1)+".", finds_results[i])

else:
    finds=find_two(actorid1,actorid2)
    # print(finds)
    if finds!=None and len(finds)!=0:
        for f in finds:
            movie1=find_movie(f[0])
            movie2=find_movie(f[2])
            result=find_actorname(actorid1)+" was in "+movie1[0]+" ("+str(movie1[1])+") "+"with "+ find_actorname(f[1])+"; " +find_actorname(f[1])+" was in "+movie2[0]+" ("+str(movie2[1])+") "+"with "+ find_actorname(actorid2)
            finds_results.append(result)
        finds_results.sort()
        for i in range(len(finds_results)):
            print(str(i + 1) + ".", finds_results[i])
    else:
        finds=find_six(actorid1,actorid2)
        if finds!=None and len(finds)!=0:
            for f in finds:
                movie1 = find_movie(f[0])
                movie2 = find_movie(f[2])
                movie3=find_movie(f[4])
                movie4=find_movie(f[6])
                movie5=find_movie(f[8])
                result=find_actorname(actorid1)+" was in "+movie1[0]+" ("+str(movie1[1])+") "+"with "+ find_actorname(f[1])+"; " \
                       +find_actorname(f[1])+" was in "+movie2[0]+" ("+str(movie2[1])+") "+"with "+ find_actorname(f[3])+"; " \
                    + find_actorname(f[3]) +" was in "+movie3[0]+" ("+str(movie3[1])+") "+"with "+find_actorname(f[5])+"; " \
                       + find_actorname(f[5]) + " was in " + movie4[0] + " (" + str(
                    movie4[1]) + ") " + "with " + find_actorname(f[7]) + "; " \
                       + find_actorname(f[7]) + " was in " + movie5[0] + " (" + str(
                    movie5[1]) + ") " + "with " + find_actorname(actorid2)
            finds_results.sort()
            for i in range(len(finds_results)):
                print(str(i + 1) + ".", finds_results[i])