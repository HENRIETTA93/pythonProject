import unittest
import psycopg2
from decimal import Decimal
from homework_5 import RestaurantData
from data_structures import RecipeInstructions

patty_melt_instructions = 'Form ground beef into patties. Cook patties to order. Place patties on bun. Serve open face'


class RestaurantDataTestCase(unittest.TestCase):
    connection_string = "host='localhost' dbname='restaurant' user='restaurant' password='restaurant'"

    conn = psycopg2.connect(connection_string)

    def setUp(self):
        with self.conn.cursor() as cursor:
            setup_queries = open('restaurant-data.sql', 'r').read()
            cursor.execute(setup_queries)
            self.conn.commit()

        self.service = RestaurantData(self.connection_string)

    def tearDown(self):
        self.service = None

    def query(self, query, parameters=()):
        cursor = self.conn.cursor()
        cursor.execute(query, parameters)
        return cursor.fetchall()

    def test_connectivity(self):
        self.assertEqual(True, self.service.check_connectivity())

    def test_find_recipe(self):
        recipes = self.service.find_recipe('ham')
        self.assertEqual(len(recipes), 3)
        self.assertTrue(list(map(lambda r: r['name'], recipes)).index('Hamburger') >= 0)

        recipes = self.service.find_recipe('sandwich')
        self.assertEqual(len(recipes), 2)

        recipes = self.service.find_recipe("';DROP TABLE recipe_ingredient;COMMIT;")
        self.assertEqual(len(recipes), 0)
        self.assertEqual(22, self.query("select count(*) from recipe_ingredient")[0][0])

    def test_get_recipe_instructions(self):
        instructions = self.service.get_recipe_instructions('Hamburger')
        self.assertEqual('Hamburger', instructions.name)
        self.assertEqual(instructions.instructions, patty_melt_instructions)
        self.assertEqual(2, len(instructions.ingredients))
        self.assertTrue(list(map(lambda i: i[0], instructions.ingredients)).index('Ground Beef') >= 0)

    def test_get_seasonal_menu(self):
        fall_menu = self.service.get_seasonal_menu('Fall')
        menu_names = list(map(lambda r: r[0], fall_menu))
        self.assertEqual(6, len(fall_menu))
        self.assertTrue(menu_names.index('Ham Sandwich') >= 0)
        self.assertTrue(menu_names.index('French Fries') >= 0)

        with self.assertRaises(ValueError):
            menu_names.index('Chicken Sandwich')

        self.assertEqual(1, len(list(filter(lambda r: not r[1], fall_menu))))

    def test_update_ingredient_price(self):
        rows_updated = self.service.update_ingredient_price('11111111', Decimal('3.49'))
        self.assertEqual(1, rows_updated)

        tested_price = self.query("SELECT cost_per_unit FROM ingredient WHERE code='11111111'")[0][0]
        self.assertEqual(Decimal('3.49'), tested_price, "Price was not updated")

        known_price = self.query("SELECT cost_per_unit FROM ingredient WHERE code='11111112'")[0][0]
        self.assertEqual(Decimal('7.49'), known_price)

    def test_add_new_recipe(self):
        recipe_instructions = RecipeInstructions('Patty Melt', patty_melt_instructions, [
            ('Sliced Bread', 0.2),
            ('Mayonnaise', 0.03125),
            ('Cheese', 0.125),
            ('Ground Beef', 0.25)
        ])
        inserted = self.service.add_new_recipe(recipe_instructions, 1, 'Entree', 'All')
        self.assertEqual(True, inserted)

        new_season = self.query("SELECT season FROM recipe WHERE name='Patty Melt'")[0][0]
        self.assertEqual('All', new_season)

        count_ingredients = self.query("SELECT count(*) FROM recipe_ingredient WHERE recipe='Patty Melt'")[0][0]
        self.assertEqual(count_ingredients, 4, "Ingredients weren't properly inserted")

        bad_instructions = RecipeInstructions('Incomplete', 'Incomplete Instructions', [
            ('Sliced Bread', 0.2),
            ('Unknown Ingredient', 1)
        ])
        inserted = self.service.add_new_recipe(bad_instructions, 1, 'Entree', 'Fall')
        self.assertEqual(False, inserted)

        new_season = self.query("SELECT season FROM recipe WHERE name='Incomplete'")
        self.assertEqual(0, len(new_season))

        missing_ingredient = self.query("SELECT name FROM ingredient WHERE name='Unknown Ingredient'")
        self.assertEqual(0, len(missing_ingredient))


if __name__ == '__main__':
    unittest.main()
