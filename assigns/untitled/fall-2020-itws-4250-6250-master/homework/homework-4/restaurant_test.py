import unittest
import psycopg2
import psycopg2.extras
# from decimal import Decimal


class RestaurantDataTestCase(unittest.TestCase):
    connection_string = "host='localhost' dbname='restaurant' user='restaurant' password='restaurant'"
    homework_file = "homework-4.sql"

    conn = psycopg2.connect(connection_string, cursor_factory=psycopg2.extras.DictCursor)

    def setUp(self):
        with self.conn.cursor() as cursor:
            with open('restaurant-data.sql', 'r') as restaurant_data:
                setup_queries = restaurant_data.read()
                cursor.execute(setup_queries)

            with open(self.homework_file, 'r') as hw_file:
                homework = hw_file.read()
                cursor.execute(homework)

            self.conn.commit()

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

    def test_inventory_check(self):
        updated = self.execute("INSERT INTO orders(recipe, quantity) VALUES('Pumpkin Pie', 11)")
        self.assertEqual(updated, 0, "The database allowed insertion of an order for which there "
                                     "wasn't sufficient inventory")

    def test_inventory_check_permissive(self):
        updated = self.execute("INSERT INTO orders(recipe, quantity) VALUES('Pumpkin Pie', 1)")
        self.assertEqual(updated, 1, "A valid order was not allowed to be inserted")

        orders = self.query("SELECT * FROM orders")
        self.assertEqual(len(orders), 1, "The wrong number of orders were inserted")

    def test_kosher_check(self):
        updated = self.execute("INSERT INTO orders(recipe, quantity, kosher) VALUES('Ham Sandwich', 1, TRUE)")
        self.assertEqual(updated, 0, "The database allowed a non-kosher recipe for a kosher order")

    def test_kosher_permissive(self):
        updated = self.execute("INSERT INTO orders(recipe, quantity, kosher) VALUES('Chicken Sandwich', 1, FALSE)")
        self.assertEqual(updated, 1, "A valid order was not allowed to be inserted")

        orders = self.query("SELECT * FROM orders")
        self.assertEqual(len(orders), 1, "The wrong number of orders were inserted")

    def test_no_filled_insert(self):
        updated = self.execute("INSERT INTO orders(recipe, quantity, filled) "
                               "VALUES ('Pumpkin Pie', 1, now())")
        self.assertEqual(updated, 0, "An order was inserted with a value in 'filled'")

    def insert_pies(self):
        return self.execute("INSERT INTO orders(recipe, quantity)"
                            "VALUES('Pumpkin Pie', 2) RETURNING order_number")

    def test_inventory_update_null(self):
        new_key = self.insert_pies()
        self.assertGreater(new_key, -1, "Invalid key")

        crusts = self.query("SELECT * FROM inventory WHERE ing_id='11111122'")
        self.assertEqual(crusts[0]['amount'], 10, "Inventory was improperly updated")

    def test_inventory_update(self):
        new_key = self.insert_pies()
        updated = self.execute("UPDATE orders SET filled=now() "
                               "WHERE order_number=%(num)s", {'num': new_key})
        self.assertEqual(updated, 1, "Order wasn't updated")
        updated_crusts = self.query("SELECT * FROM inventory WHERE ing_id='11111122'")
        self.assertEqual(updated_crusts[0]['amount'], 8,
                         "Inventory wasn't properly updated after order filled")

    def test_order_timestamp_check(self):
        new_key = self.insert_pies()
        updated = self.execute("UPDATE orders SET filled=now() "
                               "WHERE order_number=%(num)s", {'num': new_key})

        updated_order = self.execute("UPDATE orders SET filled=now()"
                                     "WHERE order_number=%(num)s", {'num': new_key})
        self.assertEqual(updated_order, 0, "Filled timestamp was improperly updated")


if __name__ == '__main__':
    unittest.main()
