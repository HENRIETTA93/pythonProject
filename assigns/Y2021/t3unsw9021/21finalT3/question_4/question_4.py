# COMP9021 21T3 - Rachid Hamadi
# Final Exam Question 4

'''
No point to hard code for small values of n, will be tested
only for large enough values...
'''

def pascal_triangle_line(n):
    '''
    Recall: it is the list of binomial coefficients that give the
    number of ways of choosing k objects out of n - 1 for 0 <= k < n.

    >>> pascal_triangle_line(1)
    [1]
    >>> pascal_triangle_line(2)
    [1, 1]
    >>> pascal_triangle_line(3)
    [1, 2, 1]
    >>> pascal_triangle_line(4)
    [1, 3, 3, 1]
    >>> pascal_triangle_line(5)
    [1, 4, 6, 4, 1]
    >>> pascal_triangle_line(6)
    [1, 5, 10, 10, 5, 1]
    >>> pascal_triangle_line(7)
    [1, 6, 15, 20, 15, 6, 1]
    >>> pascal_triangle_line(8)
    [1, 7, 21, 35, 35, 21, 7, 1]
    '''
    
    print(trig(n))

def trig(n):
    trig_list=[]
    if n==1:
        trig_list=[1]
    elif n==2:
        trig_list=[1,1]
    else:
        last_trig=trig(n-1)
        trig_list.append(1)
        # mid=len(last_trig)//2
        # i=1
        # while i<=mid:
        hip=1
        while hip<=n-2:
            trig_list.insert(hip,last_trig[hip-1]+last_trig[hip])
            hip+=1
        trig_list.append(1)
    return trig_list


          

if __name__ == '__main__':
    import doctest
    doctest.testmod()

