import psycopg2

class Restaurant():

    def __init__(self, connection_string):
        self.conn = psycopg2.connect(connection_string)

    def find_ingredient(self, ingredient_name):
        query = "SELECT * FROM ingredient WHERE ingredient='" + ingredient_name + "'"
        with self.conn.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()

    def place_order(self, recipe):
        query = "INSERT INTO orders(recipe) VALUES('" + recipe + "') RETURNING order_number"
        with self.conn.cursor() as cursor:
            cursor.execute(query)
            self.conn.commit()
            return cursor.fetchone()[0]

    def fill_order(self, order_num):
        query = "UPDATE orders SET filled=now() WHERE order_number='" + order_num + "'"
        with self.conn.cursor() as cursor:
            cursor.execute(query)
            self.conn.commit()
            return cursor.rowcount

    def find_course_recipes(self, course):
        query = "SELECT recipe FROM recipe WHERE experimental = FALSE AND course = '" + course + "'"
        with self.conn.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()

    def find_ingredient_better(self, ingredient_name):
        query = "SELECT ingredient FROM ingredient WHERE ingredient = '%s'" % (ingredient_name,)
        with self.conn.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()

    def find_ingredients_by_cost(self, course):
        # Sanitize user input to properly escape strings
        course = course.replace('\'', '\\\'')
        query = "SELECT * FROM ingredient WHERE cost_per_unit > {}".format(course)
        with self.conn.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()