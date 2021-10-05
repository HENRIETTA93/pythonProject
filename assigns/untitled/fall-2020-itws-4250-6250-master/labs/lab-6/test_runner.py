import sys
import time
import unittest

from data_test import DataTest


def err(message):
    print(message, file=sys.stderr)


def log_error(message):
    with open('connection_errors.txt', 'a') as log_file:
        log_file.write(message)
        log_file.write('\n')


if __name__ == "__main__":
    cases = unittest.TestLoader().getTestCaseNames(DataTest)

    for test_name in cases:
        with open("%s.txt" % test_name, 'w') as out:
            runner = unittest.TextTestRunner(verbosity=2, stream=out, descriptions=True)
            result = runner.run(DataTest(test_name))
            if (not result.failures) and (not result.errors):
                out.truncate(0)
