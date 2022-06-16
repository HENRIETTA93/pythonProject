from itertools import product


# Takes as argument a string consisting of 0s, 1s and underscores.
# If underscores are replaced in all possible ways by 0s and 1s,
# then one gets the representation of numbers in base 2.
#
# Prints out two lists of numbers:
# - one where the numbers are represented in base 2
#   without any leading 0 (except for the number 0 itself);
# - one where the numbers are represented in base 10.
# In both lists, numbers are ordered from smallest to largest.
#
# You can assume that the function is provided with a string as argument.


def f(pattern):
    '''
    >>> f('0')
    In base 2:
      [0]
    In base 10:
      [0]
    >>> f('_')
    In base 2:
      [0, 1]
    In base 10:
      [0, 1]
    >>> f('___')
    In base 2:
      [0, 1, 10, 11, 100, 101, 110, 111]
    In base 10:
      [0, 1, 2, 3, 4, 5, 6, 7]
    >>> f('_0_1')
    In base 2:
      [1, 11, 1001, 1011]
    In base 10:
      [1, 3, 9, 11]
    >>> f('__11')
    In base 2:
      [11, 111, 1011, 1111]
    In base 10:
      [3, 7, 11, 15]
    >>> f('1__010_')
    In base 2:
      [1000100, 1000101, 1010100, 1010101, 1100100, 1100101, 1110100, 1110101]
    In base 10:
      [68, 69, 84, 85, 100, 101, 116, 117]
    '''
    if not pattern or any(e not in '01_' for e in pattern):
        return
    # INSERT YOUR CODE HERE



if __name__ == '__main__':
    import doctest
    doctest.testmod()
