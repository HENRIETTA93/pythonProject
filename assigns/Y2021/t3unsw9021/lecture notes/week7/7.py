from functools import lru_cache
from itertools import count, islice
from math import sqrt

def fibonacci_sequence():
    yield 0
    yield 1
    previous, current = 0, 1
    while True:
        previous, current = current, previous + current
        yield current
S = fibonacci_sequence()
list(next(S) for _ in range(19))

