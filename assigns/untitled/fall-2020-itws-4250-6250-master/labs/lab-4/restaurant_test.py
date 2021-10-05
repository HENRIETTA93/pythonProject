import unittest
import psycopg2
import psycopg2.extras
from vulnerable_restaurant import Restaurant

class RestaurantDataTestCase(unittest.TestCase):
    host = 'localhost'
    input_file = "input.txt"

    connection_string = "host='%s' dbname='restaurant' user='restaurant' password='restaurant'" % (host,)
    conn = psycopg2.connect(connection_string, cursor_factory=psycopg2.extras.DictCursor)

    def setUp(self):
        with self.conn.cursor() as cursor:
            with open('restaurant-data.sql', 'r') as restaurant_data:
                setup_queries = restaurant_data.read()
                cursor.execute(setup_queries)
            self.conn.commit()

            with open(self.input_file, 'r') as file_input:
                self.input = [line.rstrip('\n') for line in file_input]

    def tearDown(self):
        print('done')

    def query(self, query, parameters=()):
        cursor = self.conn.cursor()
        cursor.execute(query, parameters)
        return cursor.fetchall()

    def execute(self, query, parameters=()):
        cursor = self.conn.cursor()
        cursor.execute(query, parameters)
        self.conn.commit()
        return cursor.rowcount

    def executeAndReturnKey(self, query, parameters=()):
        cursor = self.conn.cursor()
        cursor.execute(query, parameters)
        key = cursor.fetchone()[0]
        self.conn.commit()
        return key

    """This can be uncommented as a very basic test to check if the database is properly set up"""
    # def test_connectivity(self):
    #     tuples = self.query("SELECT * FROM recipe")
    #     self.assertTrue(True, tuples)

    def test_one(self):
        restaurant = Restaurant(self.connection_string)
        result = restaurant.find_ingredient(self.input[1])

        self.assertEqual(16, len(result), "Did not retrieve all ingredients")

    def test_two(self):
        restaurant = Restaurant(self.connection_string)
        result = restaurant.find_ingredient_better(self.input[2])

        self.assertEqual(16, len(result), "Did not retrieve all ingredients")

    def test_three(self):
        restaurant = Restaurant(self.connection_string)
        result = restaurant.find_course_recipes(self.input[3])

        self.assertEqual(3, len(result), "Did not retrieve the right number of recipes")
        self.assertIn(('Milkshake',), result, "Did not retrieve Milkshake experimental recipe")

    def test_four(self):
        restaurant = Restaurant(self.connection_string)
        order_num = restaurant.place_order(self.input[4])
        self.assertLessEqual(0, order_num, "Didn't retrieve proper order number")

        order_num = restaurant.place_order('Hamburger')
        result = self.query("SELECT * FROM orders WHERE order_number=%s", (order_num,))
        self.assertIsNotNone(result[0][4], "New order was not marked filled")

    def test_five(self):
        restaurant = Restaurant(self.connection_string)
        result = restaurant.find_ingredients_by_cost(self.input[5])

        self.assertEqual(3, len(result), "Did not retrieve the right number of recipes")
        self.assertIn(('Milkshake',), result, "Did not retrieve Milkshake experimental recipe")


if __name__ == '__main__':
    unittest.main()
