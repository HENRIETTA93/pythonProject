#!/usr/bin/python3
from os import close
import sqlite3,sys
from sqlite3.dbapi2 import Error
import itertools
if len(sys.argv) != 3:
 print("Usage: ./shortest actor_a actor_b")
 sys.exit(1)

try:
    con = sqlite3.connect('a2.db')
except sqlite3.Error as err:
    print("database error: {}", err)
cur = con.cursor()
# Find all the actor and import it into dictionary
def acquire_adjacent(actor):
    sql = '''
    select  a3.actor_id from movie m
        join acting a on m.id = a.movie_id
        join actor a2 on a.actor_id = a2.id and a2.id = ?
        join acting a3 on a3.movie_id = m.id and a3.actor_id <>  a2.id
    group by a3.actor_id;
    '''
    cur.execute(sql, (actor,))
    results = cur.fetchall()
    return [one_actor[0] for one_actor in results if one_actor[0] != actor]



def traversal_graph(actor, target_actor):
    # Get number of actor from database
    sql = "select count(*) from actor;"
    try:
      con = sqlite3.connect('a2.db')
    except sqlite3.Error as err:
        print("database error: ", err)
    cur = con.cursor()
    cur.execute(sql)
    actor_count = cur.fetchall()[0][0]
    dis = [float("inf") for _ in range(0, actor_count + 1)]
    pred = [[] for _ in range(0, actor_count)]
    visited = set([actor,])
    updated = set()
    dis[actor] = 0

    while (1):
        # Get the adjacent point
        adj_actors = acquire_adjacent(actor)
        for one in adj_actors:
            if dis[one] > dis[actor] + 1:
                dis[one] = dis[actor] + 1
                pred[one] = [actor]
            elif dis[one] == dis[actor] + 1:
                pred[one].append(actor)
            updated.add(one)
        visited.add(actor)

        # Find the next point to visit
        # which has the closest distance to origin actor
        closest = float("inf")
        closest_actor = None
        for actor in updated:
            if actor not in visited and dis[actor] < closest:
                closest_actor = actor
                closest = dis[actor]

        if closest > 6 or closest > dis[target_actor]:
            return pred
        visited.add(closest_actor)
        actor = closest_actor
    con.close()
    return pred

# Produce a list of list
def find_path(actor, target):
    pred = traversal_graph(actor, target)

    def recur(actor, target):
        # end case
        if actor in pred[target]:
            if len(pred[target]) != 1:
                raise Error
            else:
                return [[actor, target],]

        pathes = []            
        for pre_actor in pred[target]:
            multi_path = recur(actor, pre_actor)
            for i in range(0, len(multi_path)):
                multi_path[i].append(target)
            pathes.extend(multi_path)
        return pathes

    return recur(actor, target)

# Get number of actor from database
# Get the actor id of given actor
actor_name = sys.argv[1]
target_name = sys.argv[2]
sql = "select id from actor where upper(name) = upper(?)"
cur.execute(sql, (actor_name,))
actor_id = cur.fetchall()[0][0]
cur.execute(sql, (target_name,))
target_id = cur.fetchall()[0][0]

path_list = find_path(actor_id, target_id)


string_list = []
lines = []
for path in path_list:
    # We need a list of list to store moview between two actor and 

    relation_movies=[]
    # Build a name list to all the id in path
    actor_names = []
    for actor_id in path:
        sql = "select name from actor where id = ?;" 
        cur.execute(sql, [actor_id,])
        actor_names.append(cur.fetchall()[0][0])
    for i in range(0, len(path) - 1):
        # actor_a, actor_b = path[i:i+2]
        # Find actor name for these two actor
        name_a, name_b = (actor_names[i], actor_names[i+1])
        # Find the movie
        sql = '''select title, year from (
select m.title, m.year, group_concat(a2.name) as actor_name from movie m
join acting a on m.id = a.movie_id
join actor a2 on a.actor_id = a2.id
group by m.title)
where actor_name like ? and actor_name like ?;
        '''
        cur.execute(sql, [f"%{name_a}%", f"%{name_b}%"])
        movies = [(movie[0], movie[1]) for movie in cur.fetchall()]
        relation_movies.append(movies)
    relations = list(itertools.product(*relation_movies))
    for relation in relations:
        string_list = []
        for i in range(0, len(relation)):
            string = f"{actor_names[i]} was in {relation[i][0]} "
            if relation[i][1] != None:
                string += f"({relation[i][1]}) with {actor_names[i+1]}"
            else:
                string += f"with {actor_names[i+1]}"
            string_list.append(string)
        lines.append("; ".join(string_list))
lines.sort()
for i in range(0, len(lines)):
    lines[i] = f"{i + 1}. " + lines[i]
print("\n".join(lines))

            # for movie in movies:

con.close()

