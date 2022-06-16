# COMP9021 21T3 - Rachid Hamadi
# Final Exam Question 3

'''
You might find the ord() function useful.
'''

def longest_leftmost_sequence_of_consecutive_letters(word):
    '''
    You can assume that "word" is a string of nothing but lowercase letters.
    
    >>> longest_leftmost_sequence_of_consecutive_letters('')
    ''
    >>> longest_leftmost_sequence_of_consecutive_letters('a')
    'a'
    >>> longest_leftmost_sequence_of_consecutive_letters('zuba')
    'z'
    >>> longest_leftmost_sequence_of_consecutive_letters('ab')
    'ab'
    >>> longest_leftmost_sequence_of_consecutive_letters('bcab')
    'bc'
    >>> longest_leftmost_sequence_of_consecutive_letters('aefbxyzcrsdt')
    'xyz'
    >>> longest_leftmost_sequence_of_consecutive_letters('efghuvwrstuvabcde')
    'rstuv'
    '''

    # return
    # REPLACE return WITH YOUR CODE
    from itertools import permutations
    def get_subset(sequence):
        subset = []
        all_tuples_lst = []
        for i in range(1, len(sequence) + 1):
            ll = list(permutations(sequence, i))
            all_tuples_lst += ll
        for t in all_tuples_lst:
            subset.append(''.join(t))
        result_subset=[]
        for ss in subset:
            if ss in sequence:
                result_subset.append(ss)
        return result_subset
    def is_sequence(word):
        i=0
        if len(word)==1:
            return True
        else:
            j=i+1
            while j<len(word):
                if ord(word[i])+1!=ord(word[j]):
                    return False
                i+1
                j+=1
        if j==len(word):
            return True

    all_subset=get_subset(word)

    # max=0
    # leftmost_sequence={}
    # leftmost=''
    # most_seq=[]
    # for w in all_subset:
    #     if is_sequence(w):
    #         len_se = len(w)
    #         leftmost_sequence[len_se]=w
    #
    #         if max<ord(w[0]):
    #             max=ord(w[0])
    #             leftmost=w
    #             # leftmost_sequence.append(w)
    #             # if len_se not in leftmost_sequence.keys():
    #             #     leftmost_sequence[len_se]=w
    #             # else:
    #             #     leftmost_sequence[len_se] = w
    #
    #     else:
    #         continue

    # max_key=1
    # max_v=''
    # for skey in leftmost_sequence.keys():
    #     if skey>max_key:
    #         max_v=leftmost_sequence[skey]
    # print(max_v)
    # print("'"+leftmost+"'")
    if word=='':
        print("''")
        # return ''
    else:
        seq_subsets = []
        for w in all_subset:
            if is_sequence(w):
                seq_subsets.append(w)

        seq_subsets.sort()
        seq_subsets.reverse()
        lenw = 0
        result = ''
        for w in seq_subsets:
            if len(w) > lenw:
                lenw = len(w)
                result = w
            else:
                continue
        print("'" + result + "'")


                


if __name__ == '__main__':
    import doctest
    doctest.testmod()

