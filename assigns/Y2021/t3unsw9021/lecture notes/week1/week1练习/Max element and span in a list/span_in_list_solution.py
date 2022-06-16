from random import seed, randint
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
# Generates a list of nb_of_elements random integers between 0 and 99.
seed(arg_for_seed)
L = [randint(0, 99) for _ in range(nb_of_elements)]
# Prints out the list.
print('\nThe list is:', L)
# Computes the difference between the largest and smallest values
# in the list without using the builtins min() and max().
max_element = 0
min_element = 99
for e in L:
    if e > max_element:
        max_element = e
    if e < min_element:
        min_element = e
# Prints out the value of the difference within text out.
print('\nThe maximum difference between largest and smallest values in this list is:',
      max_element - min_element
     )
# Confirms the value with the builtins min() and max().
print('Confirming with builtin operations:', max(L) - min(L))
