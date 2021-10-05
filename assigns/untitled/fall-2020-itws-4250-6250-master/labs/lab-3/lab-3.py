import psycopg2
from argparse import ArgumentParser
from decimal import Decimal

ag = ArgumentParser(description="Database configuration")
ag.add_argument("--host", dest='host', default='localhost')
args = ag.parse_args()
conn_string = f"host='{args.host}' dbname='restaurant' user='restaurant' password='restaurant'"

conn = psycopg2.connect(conn_string)
cursor = conn.cursor()


def run_query(query, params=()):
    cursor.execute(query, params)
    records = cursor.fetchall()
    return records


def print_records(records):
    for r in records:
        print(r)


def read_from_cursor(query):
    cursor.execute(query)
    records = cursor.fetchmany()

    # Add one line here
    # cursor.arraysize = cursor.rowcount - 1

    # You can achieve a similar outcome by modifying this line:
    remaining_records = cursor.fetchmany(cursor.rowcount - 1)

    print("%s records remaining" % (len(remaining_records)),)
    return remaining_records


def examine_query(query, params):
    # Add your code here
    print(cursor.mogrify(query, params))
    pass


def query_parameters():
    examine_query("SELECT * FROM ingredient WHERE is_kosher=%s", (True,))
    examine_query("SELECT * FROM ingredient WHERE calories < %s", (Decimal(100.1),))
    examine_query("SELECT * FROM ingredient WHERE calories < %s", ("100.1",))
    examine_query("SELECT * FROM recipe_ingredient WHERE amount < %s", (0.1,))
    examine_query("SELECT * FROM recipe_ingredient WHERE amount < %s", (Decimal(0.1),))
    examine_query("SELECT * FROM ingredient WHERE ingredient.ingredient ilike %s",
                     ("chicken",))
    examine_query("SELECT * FROM ingredient WHERE ingredient.ingredient ilike %s",
                     ("hellman's%",))
    examine_query("SELECT * FROM recipe WHERE recipe ilike '%%%s%%'", ("chicken",))


def explore_information_schema():
    #
    print_records(run_query())

    # query to find the tables and columns that have a check constraint other than NOT NULL

    # query to find the tables whose tuples could be deleted if the right tuples are deleted from other tables


if __name__ == '__main__':
    read_from_cursor("SELECT * FROM ingredient")
    query_parameters()

