import unittest
from lxml import etree
from homework_6 import ComposerPageQueryTool as QueryTool


class QueryToolTest(unittest.TestCase):
    xml_file = 'long-data.xml'
    parser = etree.XMLParser(ns_clean=True)

    def setUp(self):
        tree = etree.parse(self.xml_file, self.parser)
        self.query_tool = QueryTool(tree)

    def test_count_comments(self):
        count = self.query_tool.count_comments()
        self.assertEqual(count, 560)

    def test_count_contributions(self):
        count = self.query_tool.count_revisions_by_user()
        self.assertEqual(count, 70)

    def test_contribution_timestamp(self):
        timestamp = self.query_tool.contribution_timestamp()[0]
        self.assertEqual(timestamp, '2014-08-17T18:34:29Z')

    def test_count_larger_pages(self):
        count = self.query_tool.count_larger_pages()
        self.assertEqual(count, 1572)

    def test_page_reviser(self):
        reviser = self.query_tool.page_reviser()[0]
        self.assertEqual(reviser, 'Steltz')

    def test_title_timestamp(self):
        title = self.query_tool.title_timestamp()[0]
        self.assertEqual(title, '36 Cadenzas, K.624/626a (Mozart, Wolfgang Amadeus)')

    def test_count_sonata(self):
        count = self.query_tool.count_sonata()
        self.assertEqual(count, 17)

    def test_sibling_tag(self):
        tag = self.query_tool.sibling_tag()
        self.assertEqual(tag, 'contributor')