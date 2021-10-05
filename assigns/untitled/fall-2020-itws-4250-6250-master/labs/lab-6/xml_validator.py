from lxml import etree
from io import StringIO
import sys


class XmlValidator:

    class FileError(Exception):
        """Problems finding/opening files"""
        pass

    class ParseError(Exception):
        """Problems parsing an XML file"""
        pass

    class ValidationError(Exception):
        """XML document didn't validate"""
        pass

    def __init__(self, schema):
        parser = etree.XMLParser(ns_clean=True)
        schema_doc = etree.parse(schema, parser)
        self.schema = etree.XMLSchema(schema_doc)

    @staticmethod
    def parse(file):
        try:
            doc = etree.parse(file)
            return doc
        except IOError:
            """Couldn't find file"""
            raise XmlValidator.FileError
        except etree.XMLSyntaxError as err:
            """XML not well-formed"""
            raise XmlValidator.ParseError

    def validate(self, doc):
        try:
            self.schema.assertValid(doc)
            return True
        except etree.DocumentInvalid as err:
            """Not valid"""
            raise XmlValidator.ValidationError

if __name__ == "__main__":
    v = XmlValidator('restaurant-schema.xsd')
    file = 'restaurant-data.xml'
    if len(sys.argv) > 2:
        v = XmlValidator(sys.argv[2])
    if len(sys.argv) > 1:
        file = sys.argv[1]
    doc = XmlValidator.parse(file)
    if v.validate(doc):
        print('%s is well-formed and valid xml' % file)