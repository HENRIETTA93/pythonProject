import psycopg2
import psycopg2.extras
from data_structures import RecipeInstructions


class RestaurantData:

    def __init__(self, connection_string):
        self.conn = psycopg2.connect(connection_string)

    def check_connectivity(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM recipe LIMIT 1")
        records = cursor.fetchall()
        return len(records) == 1

