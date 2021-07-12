import sqlite3, sys
if len(sys.argv) !=3:
    print("Usage:", sys.argv[0], "actor1 actor2")
    sys.exit(1)


param_actor1=sys.argv[1].lower()
param_actor2=sys.argv[2].lower()

if len(param_actor1)==0 or len(param_actor2)==0:
    sys.exit(1)

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


sql_actor_query="select movie_id,actor_id from acting join actor on acting.actor_id=actor.id where lower(actor.name)="
# sql_inter=" intersect "

sql=sql_actor_query+"'"+param_actor1+"'"

# print(sql)

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


was_in=" was in "
withs=" with "

param_actorid1=actor1[0]
param_actorid2=actor2[0]

results=[]
resulttmp=()
count=0


cur1=con.cursor()
cur2=con.cursor()
cur3=con.cursor()
cur33=con.cursor()
cur4=con.cursor()
cur44=con.cursor()
cur5=con.cursor()
cur55=con.cursor()
cur6=con.cursor()
cur66=con.cursor()
curr = con.cursor()

for movieid in movieids:
    if count>=6:
        break
    sql_find1 = "select movie_id, actor_id from acting where movie_id=" + str(movieid)
    # print(sql_find1)
    cur1.execute(sql_find1)
    t_result1=cur1.fetchall()
    for t in t_result1:
        if count>=6:
            break
        if t[1]==param_actorid2: #1 first find yes
            count+=1
            if count<=6:
                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                      "where movie.id=" + str(movieid) + " and actor.id=" + str(t[1])
                curr.execute(str1)
                findr=curr.fetchall()
                for rr in findr:
                    find_result=actor1[1] +was_in+rr[1]+" ("+str(rr[2])+")"+ withs+rr[3]
                    results.append(find_result)
                    print(find_result)
            else:
                break
        else: # 2 beign find
            count+=1
            tmp_result=""
            if count<=6:
                str1="select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                    "where movie.id=" + str(movieid)+ " and actor.id=" + str(t[1])+ " and actor.id!=" +str(param_actorid1)
                curr.execute(str1)
                tmpr = curr.fetchone()
                if tmpr is None or len(tmpr)==0:
                    count-=1
                    continue

                tmp_result += actor1[1] + was_in + tmpr[1] + " (" + str(tmpr[2]) + ")" + withs + tmpr[3]
                # print(tmp_result)
                # results.append(tmp_result)

                sql_find2="select movie_id, actor_id from acting where actor_id="+str(t[1])
                cur2.execute(sql_find2)
                t_result2=cur2.fetchall()
                print(t_result2)
                if t_result2 is None or len(t_result2)==0:
                    continue
                for tt in t_result2:
                    movieid=tt[0]
                    actorid=tt[1]
                    cur3.execute("select movie_id, actor_id from acting where movie_id=" + str(tt[0]))
                    t_result3=cur3.fetchall()
                    if t_result3 is None or len(t_result3)==0:
                        continue
                    for tt3 in t_result3:
                        if tt3[1]==param_actorid2:
                            count+=1
                            if count<=6: # second find yes
                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                   "where movie.id=" + str(movieid) + " and actor.id=" + str(tt3[1])
                                curr.execute(str1)
                                findr = curr.fetchall()
                                for rr in findr:
                                    find_result=tmp_result+"; "+ tmpr[3] + was_in + rr[1] + " (" + str(rr[2]) + ")" + withs + rr[3]
                                    results.append(find_result)
                                    print(find_result)
                            else:
                                break
                        else: # 3 begin find third
                            count += 1
                            tmp_result = ""
                            if count <= 6:
                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                       "where movie.id=" + str(movieid) + " and actor.id=" + str(tt3[1]) + " and actor.id!=" + str(t[1])
                                curr.execute(str1)
                                tmpr = curr.fetchone()
                                if tmpr is None or len(tmpr) == 0:
                                    count -= 1
                                    continue

                                tmp_result += actor1[1] + was_in + tmpr[1] + " (" + str(tmpr[2]) + ")" + withs + tmpr[3]
                                # print(tmp_result)
                                # results.append(tmp_result)

                                sql_find3 = "select movie_id, actor_id from acting where actor_id=" + str(tt3[1])
                                cur33.execute(sql_find3)
                                t_result33 = cur33.fetchall()
                                print(t_result33)
                                if t_result33 is None or len(t_result33) == 0:
                                    continue
                                for tt in t_result33:
                                    movieid = tt[0]
                                    actorid = tt[1]
                                    cur4.execute("select movie_id, actor_id from acting where movie_id=" + str(tt[0]))
                                    t_result4 = cur4.fetchall()
                                    if t_result4 is None or len(t_result4)==0:
                                        continue
                                    for tt4 in t_result4:
                                        if tt4[1] == param_actorid2:
                                            count += 1
                                            if count <= 6:  # third find yes
                                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                                       "where movie.id=" + str(movieid) + " and actor.id=" + str(tt4[1])
                                                curr.execute(str1)
                                                findr = curr.fetchall()
                                                for rr in findr:
                                                    find_result = tmp_result + "; " + tmpr[3] + was_in + rr[
                                                        1] + " (" + str(rr[2]) + ")" + withs + rr[3]
                                                    results.append(find_result)
                                                    print(find_result)
                                            else:
                                                break
                                        else:  # 4 find fourth begin
                                            count += 1
                                            tmp_result = ""
                                            if count <= 6:
                                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                                       "where movie.id=" + str(movieid) + " and actor.id=" + str(
                                                    tt4[1]) + " and actor.id!=" + str(tt3[1])
                                                curr.execute(str1)
                                                tmpr = curr.fetchone()
                                                if tmpr is None or len(tmpr) == 0:
                                                    count -= 1
                                                    continue

                                                tmp_result += actor1[1] + was_in + tmpr[1] + " (" + str(
                                                    tmpr[2]) + ")" + withs + tmpr[3]
                                                # print(tmp_result)
                                                # results.append(tmp_result)

                                                sql_find4 = "select movie_id, actor_id from acting where actor_id=" + str(
                                                    tt4[1])
                                                cur44.execute(sql_find4)
                                                t_result44 = cur44.fetchall()
                                                print(t_result44)
                                                if t_result44 is None or len(t_result44) == 0:
                                                    continue
                                                for tt in t_result44:
                                                    movieid = tt[0]
                                                    actorid = tt[1]
                                                    cur4.execute(
                                                        "select movie_id, actor_id from acting where movie_id=" + str(
                                                            tt[0]))
                                                    t_result5 = cur5.fetchall()
                                                    if t_result5 is None or len(t_result5)==0:
                                                        continue
                                                    for tt5 in t_result5:
                                                        if tt5[1] == param_actorid2:
                                                            count += 1
                                                            if count <= 6:  # fourth find yes
                                                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                                                       "where movie.id=" + str(
                                                                    movieid) + " and actor.id=" + str(tt5[1])
                                                                curr.execute(str1)
                                                                findr = curr.fetchall()
                                                                for rr in findr:
                                                                    find_result = tmp_result + "; " + tmpr[3] + was_in + \
                                                                                  rr[
                                                                                      1] + " (" + str(
                                                                        rr[2]) + ")" + withs + rr[3]
                                                                    results.append(find_result)
                                                                    print(find_result)
                                                            else:
                                                                break
                                                        else:  # 5 find fifth begin
                                                            count += 1
                                                            tmp_result = ""
                                                            if count <= 6:
                                                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                                                       "where movie.id=" + str(
                                                                    movieid) + " and actor.id=" + str(
                                                                    tt5[1]) + " and actor.id!=" + str(tt4[1])
                                                                curr.execute(str1)
                                                                tmpr = curr.fetchone()
                                                                if tmpr is None or len(tmpr) == 0:
                                                                    count -= 1
                                                                    continue

                                                                tmp_result += actor1[1] + was_in + tmpr[1] + " (" + str(
                                                                    tmpr[2]) + ")" + withs + tmpr[3]
                                                                # print(tmp_result)
                                                                # results.append(tmp_result)

                                                                sql_find5 = "select movie_id, actor_id from acting where actor_id=" + str(
                                                                    tt5[1])
                                                                cur55.execute(sql_find5)
                                                                t_result55 = cur55.fetchall()
                                                                print(t_result55)
                                                                if t_result55 is None or len(t_result55) == 0:
                                                                    continue
                                                                for tt in t_result55:
                                                                    movieid = tt[0]
                                                                    actorid = tt[1]
                                                                    cur6.execute(
                                                                        "select movie_id, actor_id from acting where movie_id=" + str(
                                                                            tt[0]))
                                                                    t_result6 = cur6.fetchall()
                                                                    if t_result6 is None or len(t_result6)==0:
                                                                        continue
                                                                    for tt6 in t_result6:
                                                                        if tt6[1] == param_actorid2:
                                                                            count += 1
                                                                            if count <= 6:  # fith find yes
                                                                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                                                                       "where movie.id=" + str(
                                                                                    movieid) + " and actor.id=" + str(
                                                                                    tt6[1])
                                                                                curr.execute(str1)
                                                                                findr = curr.fetchall()
                                                                                for rr in findr:
                                                                                    find_result = tmp_result + "; " + \
                                                                                                  tmpr[3] + was_in + \
                                                                                                  rr[
                                                                                                      1] + " (" + str(
                                                                                        rr[2]) + ")" + withs + rr[3]
                                                                                    results.append(find_result)
                                                                                    print(find_result)
                                                                            else:
                                                                                break
                                                                        else:  # 6 find fifth begin
                                                                            count += 1
                                                                            tmp_result = ""
                                                                            if count <= 6:
                                                                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                                                                       "where movie.id=" + str(
                                                                                    movieid) + " and actor.id=" + str(
                                                                                    tt6[1]) + " and actor.id!=" + str(
                                                                                    tt5[1])
                                                                                curr.execute(str1)
                                                                                tmpr = curr.fetchone()
                                                                                if tmpr is None or len(tmpr) == 0:
                                                                                    count -= 1
                                                                                    continue

                                                                                tmp_result += actor1[1] + was_in + tmpr[
                                                                                    1] + " (" + str(
                                                                                    tmpr[2]) + ")" + withs + tmpr[3]
                                                                                # print(tmp_result)
                                                                                # results.append(tmp_result)

                                                                                sql_find6 = "select movie_id, actor_id from acting where actor_id=" + str(
                                                                                    tt6[1])
                                                                                cur66.execute(sql_find6)
                                                                                t_result66 = cur66.fetchall()
                                                                                print(t_result66)
                                                                                if t_result66 is None or len(
                                                                                        t_result66) == 0:
                                                                                    continue
                                                                                for tt in t_result66:
                                                                                    movieid = tt[0]
                                                                                    actorid = tt[1]
                                                                                    cur6.execute(
                                                                                        "select movie_id, actor_id from acting where movie_id=" + str(
                                                                                            tt[0]))
                                                                                    t_result7 = cur6.fetchall()
                                                                                    if t_result7 is None or len(
                                                                                            t_result7)==0:
                                                                                        continue
                                                                                    for tt7 in t_result7:
                                                                                        if tt7[1] == param_actorid2:
                                                                                            count += 1
                                                                                            if count <= 6:  # fith find yes
                                                                                                str1 = "select movie.id,movie.title,movie.year, actor.name from movie join acting on movie.id=acting.movie_id join actor on acting.actor_id=actor.id " \
                                                                                                       "where movie.id=" + str(
                                                                                                    movieid) + " and actor.id=" + str(
                                                                                                    tt7[1])
                                                                                                curr.execute(str1)
                                                                                                findr = curr.fetchall()
                                                                                                for rr in findr:
                                                                                                    find_result = tmp_result + "; " + \
                                                                                                                  tmpr[
                                                                                                                      3] + was_in + \
                                                                                                                  rr[
                                                                                                                      1] + " (" + str(
                                                                                                        rr[
                                                                                                            2]) + ")" + withs + \
                                                                                                                  rr[3]
                                                                                                    results.append(
                                                                                                        find_result)
                                                                                                    print(find_result)
                                                                                            else:
                                                                                                break
                                                                                        else:  # 7 find fifth begin
                                                                                            continue
    count=0

results.sort()
print("========================================================")
print(results)
results.sort()
for result in results:
    print(result)

# for movieid in movieids:
#     # select movie_id, actor_id from acting where movie_id=movieid
#     sql_find1 = "select movie_id, actor_id from acting where movie_id=" + str(movieid)
#     cur1.execute(sql_find1)
#     t_result1=cur1.fetchall()
#     for t in t_result1:
#         if t[1]==param_actorid2: #find first
#             count+=1
#             if count<=6:
#                 results.append()
#                 #
#                 sql_find2="select movie_id, actor_id from acting where actor_id="+str(t[1])
#             else:
#                 break
#         else: #find first doesn't find
#             count+=1
#             if count<=6:
#                 cur2.execute(sql_find1)
#                 t_result2=cur2.fetchall()
#                 for t in t_result2:
#                     if t[1]==param_actorid2: #find second
#                         count+=1
#                         if count<=6:
#                             results.append()
#                         else:
#                             break
#                     else:
#                         count+=1
#                         if count<=6:
#                             cur3.execute(sql_find1)
#                             t_result3=cur3.fetchall()
#                             for t in t_result3:
#                                 if t[1]==param_actorid2:
#                                     count+=1
#                                     if count<=6:
#                                         results.append()
#                                     else:
#                                         break
#                                 else:
#                                     count+=1
#                                     if count<=6:
#                                         pass
#
#                         else:
#                             break
#             else:
#                 break