import psycopg2
import psycopg2.extras

conn_string = "host='localhost' dbname='example_db' user='example_user' password='password'"

conn = psycopg2.connect(conn_string)
cursor = conn.cursor()


capacity = 30
# course_name = 'Database Applications and Systems'
course_name = "Data'; SELECT * FROM grades WHERE student_email <> '"
semester = 'F20'


# Bad. DON'T DO THIS

# query = "SELECT * FROM course WHERE semester='" + semester + "' AND name='" + course_name + "'"

"""
SELECT * 
FROM course 
WHERE semester='F20' AND name='Data'; SELECT * FROM grades WHERE student_email <> ''
"""

# Or this

capacity = "30; SELECT * FROM grades"

query = "SELECT * FROM course WHERE capacity < " + str(capacity)

cursor.execute(query)

records = cursor.fetchall()


for t in records:
    print(t)



# Good. Do it this way

query = "SELECT * FROM course WHERE semester=%s AND name=%s" 
print(cursor.mogrify(query, (semester, course_name)))
# cursor.execute(query, (semester, course_name))
#
# records = cursor.fetchall()
#
#
# for t in records:
#     print(t)


