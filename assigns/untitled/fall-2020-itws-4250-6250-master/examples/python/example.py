import psycopg2
import psycopg2.extras


conn_string = "host='localhost' dbname='example_db' user='example_user' password='password'"
conn = psycopg2.connect(conn_string)

# cursor = conn.cursor()
cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)


def basic():
    cursor.execute("SELECT * FROM course")
    records = cursor.fetchall()

    for t in records:
        print(t)


def with_params():
    query = "SELECT * FROM course WHERE name=%s AND capacity>%s"
    cursor.execute(query, ('Database Applications and Systems', 20))

    records = cursor.fetchall()
    for t in records:
        print(t)


def with_named_params():
    query = "SELECT * FROM course WHERE name=%(name)s AND capacity>%(capacity)s"
    cursor.execute(query, {'name': 'Database Applications and Systems', 'capacity': 20})

    records = cursor.fetchall()
    for t in records:
        print(t)


def check_enrollment():
    check_query = "SELECT * FROM enroll"
    cursor.execute(check_query)

    records = cursor.fetchall()
    print("Enrollment")
    for t in records:
        # print(t)
        print("Student: " + t['student_email'])


def insert():
    update_query = """INSERT INTO enroll(student_email, course_name, semester) 
    VALUES ('fran@example.com', 'Database Applications and Systems', 'F20')"""

    cursor.execute(update_query)

if __name__ == "__main__":
    check_enrollment()
    # insert()
    # check_enrollment()
    # conn.commit()
