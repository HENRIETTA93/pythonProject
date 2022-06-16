
# Returns the number of ways of selecting numbers in the first
# argument that multiplied together, result in the second
# argument.
#
# Recall that the product of an empty sequence of numbers equals 1.
#
# You can assume that the function is called with a list of
# integers as first argument, and an integer as second argument.


def f(numbers, desired_product):
    '''
    >>> f([2], 3)
    0
    >>> f([2, 3, 5], 11)
    0
    >>> f([1], 1)
    2
    >>> f([1, 1, 1], 1)
    8
    >>> f([2, 3], 2)
    1
    >>> f([1, 2, 3], 2)
    2
    >>> f([1, 2, 3], 6)
    2
    >>> f([3, 8, 7, 3, 7, 3, 7, 8, 5], 3 * 3 * 7)
    9
    >>> f([2, 5, 7, 11] * 4, 2 * 5 * 7)
    64
    >>> f([1, 2, 5, 7, 11] * 4, 2 * 5 * 7)
    1024
    >>> f(list(range(1, 10)), 40)
    4
    '''

    # REPLACE THE RETURN STATEMENT ABOBVE WITH YOUR CODE


if __name__ == '__main__':
    import doctest
    doctest.testmod()
