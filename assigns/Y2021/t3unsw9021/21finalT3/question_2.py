# COMP9021 21T3 - Rachid Hamadi
# Final Exam Question 2

def redistribute(list_of_lists):
    '''
    list_of_lists being a list of n lists of length l1, ..., ln,
    returns a list of n lists of length l1, ..., ln consisting of
    all elements in list_of_lists ordered from smallest to largest.

    You can assume that the lists in list_of_lists are lists of integers.
    
    >>> redistribute([[]])
    [[]]
    >>> redistribute([[3, 1, 10, 5, 1, 10, 8]])
    [[1, 1, 3, 5, 8, 10, 10]]
    >>> redistribute([[2], [1], [2], [4]])
    [[1], [2], [2], [4]]
    >>> redistribute([[3, 40], [0], [7]])
    [[0, 3], [7], [40]]
    >>> redistribute([[32], [3, 40, 7], [40, 11]])
    [[3], [7, 11, 32], [40, 40]]
    >>> redistribute([[97, 21], [65], [9, 25, 24], [64], [73, 38, 98, 50]])
    [[9, 21], [24], [25, 38, 50], [64], [65, 73, 97, 98]]
    '''
    
    # return
    # REPLACE return WITH YOUR CODE
    # import numpy as np
    # np_arr=np.array(list_of_lists)
    # lists=np_arr.flatten()
    len_lists=[]
    for lst in list_of_lists:
        len_lists.append(len(lst))
    from itertools import chain
    chain_list=list(chain.from_iterable(list_of_lists))
    chain_list.sort()
    # print(chain_list)
    result_list=[]
    index=0
    for i in range(len(len_lists)):
        len_l=len_lists[i]
        listss=chain_list[index:index+len_l]
        result_list.append(listss)
        i+=1
        index+=len_l
    print(result_list)


if __name__ == '__main__':
    # import doctest
    # doctest.testmod()
    redistribute([[97, 21], [65], [9, 25, 24], [64], [73, 38, 98, 50]])
    redistribute([[2], [1], [2], [4]])

