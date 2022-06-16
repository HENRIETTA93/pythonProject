
from random import seed, randrange
import sys


# Prompts the user for an integer to provide as argument to the
# seed() function.
try:
    arg_for_seed = int(input('Feed the seed with an integer: '))
except ValueError:
    print('Input is not an integer, giving up.')
    sys.exit()   
# Prompts the user a strictly positive number, nb_of_elements.
try:
    nb_of_elements = int(input('How many elements do you want to generate? '))
except ValueError:
    print('Input is not an integer, giving up.')
    sys.exit()
if nb_of_elements <= 0:
    print('Input should be strictly positive, giving up.')
    sys.exit()
seed(arg_for_seed)
# Generates a list of nb_of_elements random integers between 0 and 19.
L = [randrange(20) for _ in range(nb_of_elements)]
# Prints out the list.
print('\nThe list is:', L)
print()
# Computes the number of elements strictly less 5, 10, 15 and 20.
# - intervals[0] to record the number of elements between 0 and 4,
#   that is, elements e such that e // 5 == 0
# - intervals[1] to record the number of elements between 5 and 9
#   that is, elements e such that e // 5 == 1
# - intervals[2] to record the number of elements between 10 and 14
#   that is, elements e such that e // 5 == 2
# - intervals[3] to record the number of elements between 15 and 19
#   that is, elements e such that e // 5 == 3
intervals = [0] * 4
for e in L:
    intervals[e // 5] += 1
# Prints those numbers within some text out.
for i in range(4):
    if intervals[i] == 0:
        print('There is no element', end=' ')
    elif intervals[i] == 1:
        print('There is 1 element', end=' ')
    else:
        print('There are', intervals[i], 'elements', end=' ')
    print(f'between {5 * i} and {5 * i + 4}.')
