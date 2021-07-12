import sqlite3, sys
if len(sys.argv) !=3:
    print("Usage:", sys.argv[0], "actor1 actor2")
    sys.exit(1)


param_actor1=sys.argv[1].lower()
param_actor2=sys.argv[2].lower()

con = sqlite3.connect('D:\\02Coding\\Pycharm\\assigns\\unsw3311\\a2.db')

#############################################################
cur_actor=con.cursor()
sql_actor1="select id, name from actor where lower(name)="+"'"+param_actor1+"'"
sql_actor2="select id, name from actor where lower(name)="+"'"+param_actor2+"'"
# print(sql_actor1)
# print(sql_actor2)
cur_actor.execute(sql_actor1)
actor1=cur_actor.fetchone()
if actor1 is None or len(actor1)==0:
    sys.exit(1)
cur_actor.execute(sql_actor2)

actor2=cur_actor.fetchone()
if actor2 is None or len(actor2)==0:
    sys.exit(1)

print(actor1)
print(actor2)

##############################################################

cur = con.cursor()
if len(param_actor1)==0 or len(param_actor2)==0:
    sys.exit(1)

sql_actor_query="select movie_id,actor_id from acting join actor on acting.actor_id=actor.id where lower(actor.name)="
# sql_inter=" intersect "

sql=sql_actor_query+"'"+param_actor1+"'"

print(sql)

cur.execute(sql)
movies=cur.fetchall()
if movies is None:
    sys.exit(1)

# movieids="("
# for movie in movies:
#     movieids+=str(movie[0])+","
# movieids=movieids[0:len(movieids)-1]
# movieids+=")"


movieids=[]
for movie in movies:
    movieids.append(movie[0])
# print(movieids)
movieids.sort()
# print(movieids)
sql_query="select title, year from movie where id = "


was_in="was in "
withs="with "


param_actorid2=actor2[1]

results=[]
resulttmp=()
count=0

cur1=con.cursor()
cur2=con.cursor()
cur3=con.cursor()
cur4=con.cursor()
cur5=con.cursor()
cur6=con.cursor()
for movieid in movieids:
    # select movie_id, actor_id from acting where movie_id=movieid
    sql_find1="select movie_id, actor_id from acting where movie_id="+str(movieid)
    cur1.execute(sql_find1)
    t_result1=cur1.fetchall()
    for t in t_result1:
        if t[1]==param_actorid2: #find first
            count+=1
            if count<=6:
                results.append()
            else:
                break
        else: #find first doesn't find
            count+=1
            if count<=6:
                cur2.execute(sql_find1)
                t_result2=cur2.fetchall()
                for t in t_result2:
                    if t[1]==param_actorid2: #find second
                        count+=1
                        if count<=6:
                            results.append()
                        else:
                            break
                    else:
                        count+=1
                        if count<=6:
                            cur3.execute(sql_find1)
                            t_result3=cur3.fetchall()
                            for t in t_result3:
                                if t[1]==param_actorid2:
                                    count+=1
                                    if count<=6:
                                        results.append()
                                    else:
                                        break
                                else:
                                    count+=1
                                    if count<=6:
                                        pass

                        else:
                            break
            else:
                break