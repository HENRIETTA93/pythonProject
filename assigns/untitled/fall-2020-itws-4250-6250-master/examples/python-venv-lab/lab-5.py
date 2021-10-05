import psycopg2
from tabulate import tabulate

host = 'localhost'
database = 'example_db'
user = 'example_user'
password = 'example-password'

connection_string = f"host='{host}' dbname='{database}' user='{user}' password='{password}'"

connection = psycopg2.connect(connection_string)

course_query = "SELECT * FROM course"
student_query = "SELECT * FROM student"


def main():
    cursor = connection.cursor()
    query = course_query
    cursor.execute(query)
    records = cursor.fetchall()

    print(tabulate(records))


if __name__ == "__main__":
    main()