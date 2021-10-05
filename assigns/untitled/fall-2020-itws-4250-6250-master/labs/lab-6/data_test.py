from lxml import etree
import unittest
from xml_validator import XmlValidator


class DataTest(unittest.TestCase):
    schema_file = 'restaurant-schema.xsd'
    data_file = 'restaurant-data.xml'
    parser = etree.XMLParser(ns_clean=True)
    data_tree = etree.parse(data_file, parser)

    def run_query(self, query):
        return self.data_tree.xpath(query)

    def test_valid_xml(self):
        v = XmlValidator(self.schema_file)
        try:
            self.assertTrue(v.validate(self.data_tree), "Did not validate data file")
        except XmlValidator.ValidationError:
            self.fail("Data file was not valid")

    def test_restaurant_name(self):
        name = self.run_query('/restaurant/name/text()')[0]
        self.assertEqual("Data Bites Restaurant", name, "Restaurant name missing or incorrect")

    def test_number_of_recipes(self):
        count = self.run_query('count(/restaurant/menu/recipes/recipe)')
        self.assertGreaterEqual(count, 2, "Not enough recipes were found")

    def test_seasonal_recipe(self):
        name = self.run_query('/restaurant/menu/recipes/recipe[@name="Chili"]/@season')
        self.assertTrue(name, "Chili recipe not found")
        self.assertEqual("Fall", name[0], "Chili recipe not correct season")

    def test_number_of_employees(self):
        count = self.run_query('count(/restaurant/employees/employee)')
        self.assertEqual(3, count, "Wrong number of employees found")

    def test_dishwasher_pay(self):
        dishwasher = self.run_query('/restaurant/employees/employee[job="dishwasher"]/payrate/text()')
        self.assertTrue(dishwasher, "No dishwashers found")
        self.assertEqual(len(dishwasher), 1, "Wrong number of dishwashers found")
        self.assertEqual(dishwasher[0], '10.00', "Dishwasher payrate is incorrect")

    def test_six_ingredient_recipe(self):
        count = self.run_query('count(/restaurant/menu/recipes/recipe[count(ingredients/ingredient) = 6])')
        self.assertGreaterEqual(count, 1, "No recipe with exactly 6 ingredients found")