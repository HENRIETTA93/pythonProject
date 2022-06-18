from random import seed, randint
nb_of_elements=0
max_element=10
seed(0)
L = [randint(0, max_element) for _ in range(nb_of_elements)]
print('Here is L:', L)

# for i in range(1,9):
#     print(i)

def display(square, size):
    print('\n'.join(' '.join(f'{x:{size}}' for x in row) for row in square))

square=[[1,0],[0,1]]
size=2
display(square,2)

from collections import deque as dq
dqnum=dq([])
# input1=int(input("input a number:"))
# while True:
#     if input1<=0:
#         break
#     else:
#         dqnum.append(input1)
#     input1=int(input("input a number:"))

# print(list(dqnum))
# print(len(dqnum))
# print(dqnum[0])




strss='-0.99'
str1='-1.02'
str2='0.2'
print(float('-0.99'))
print(float(strss)>float(str1))
print(float(strss)>float(str2))

from itertools import permutations
test1='ONESIX'

# print(permutations(test1))
# for w in permutations(test1):
#     print(''.join(w))

sets=set()
sets.add(1)
sets.add(2)
sets.add(2)
print(sets)
lst=list(sets)
print(lst)

from itertools import permutations
from itertools import chain

def get_subset(sequence):
    subset=[]
    all_tuples_lst=[]
    for i in range(1, len(sequence)+1):
        ll=list(permutations(sequence,i))
        all_tuples_lst+=ll
    for t in all_tuples_lst:
        subset.append(''.join(t))
    return subset
sss='ABC'
lst=get_subset(sss)
print(lst)

# print(list(permutations(sss,3)))

def good_subsequences(word):
    '''
    >>> good_subsequences('')
    ['']
    >>> good_subsequences('aaa')
    ['', 'a']
    >>> good_subsequences('aaabbb')
    ['', 'a', 'ab', 'b']
    >>> good_subsequences('aaabbc')
    ['', 'a', 'ab', 'abc', 'ac', 'b', 'bc', 'c']
    >>> good_subsequences('aaabbaaa')
    ['', 'a', 'ab', 'b', 'ba']
    >>> good_subsequences('abbbcaaabccc')
    ['', 'a', 'ab', 'abc', 'ac', 'acb', 'b', 'ba', 'bac',\
 'bc', 'bca', 'c', 'ca', 'cab', 'cb']
    >>> good_subsequences('abbbcaaabcccaaa')
    ['', 'a', 'ab', 'abc', 'ac', 'acb', 'b', 'ba', 'bac',\
 'bc', 'bca', 'c', 'ca', 'cab', 'cb', 'cba']
    >>> good_subsequences('abbbcaaabcccaaabbbbbccab')
    ['', 'a', 'ab', 'abc', 'ac', 'acb', 'b', 'ba', 'bac',\
 'bc', 'bca', 'c', 'ca', 'cab', 'cb', 'cba']
    '''
    if word=='':
        return ''

    no_duplicated_words=[]

    for w in word:
        if w not in no_duplicated_words:
            no_duplicated_words.append(w)
    return_subs=['']
    subsets=get_subset(''.join(no_duplicated_words))
    # for ss in subsets:
    #     if ss in ''.join(no_duplicated_words):
    #         return_subs.append(ss)
    return_subs+=subsets
    return_subs.sort()

    print(return_subs)

if __name__ == '__main__':
    import doctest
    doctest.testmod()


ss='''But he
suddenly started up, and, closing his eyes, placed his fingers upon the lids, as though
he sought to imprison within his brain some curious dream from which he feared he
might awake.'''

ss2="""As he looked at the gracious and comely form he had so skilfully mirrored in his art,
a smile of pleasure passed across his face, and seemed about to linger there."""
ss.replace('\n',' ')
ss.replace(',',' ')
print(ss)
ss1=ss.split(r"[\n,\t,' ']")
print(ss1)
print(len(ss1))

print(','.isalpha())

import numpy as np
list_of_lists=[[1,2],[2]]
# np_arr = np.array(list_of_lists)
# np_arr.flatten()
# print(np_arr)

from itertools import chain

chain_list = list(chain.from_iterable(list_of_lists))
chain_list.sort()
print(chain_list)