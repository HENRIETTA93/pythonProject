# COMP9021 21T3 - Rachid Hamadi
# Sample Exam Question 7


'''
Will be tested with height a strictly positive integer.
'''


def f(height):
    '''
    >>> f(1)
    0
    >>> f(2)
     0
    123
    >>> f(3)
      0
     123
    45678
    >>> f(4)
       0
      123
     45678
    9012345
    >>> f(5)
        0
       123
      45678
     9012345
    678901234
    >>> f(6)
         0
        123
       45678
      9012345
     678901234
    56789012345
    >>> f(20)
                       0
                      123
                     45678
                    9012345
                   678901234
                  56789012345
                 6789012345678
                901234567890123
               45678901234567890
              1234567890123456789
             012345678901234567890
            12345678901234567890123
           4567890123456789012345678
          901234567890123456789012345
         67890123456789012345678901234
        5678901234567890123456789012345
       678901234567890123456789012345678
      90123456789012345678901234567890123
     4567890123456789012345678901234567890
    123456789012345678901234567890123456789
    '''
    # Insert your code here
    mountain_dic={}
    for i in range(height):
        mountain_dic[height]=''

    width=height*2-1
    count=[0,1,2,3,4,5,6,7,8,9]
    j=0
    str1=''
    for i in range(height):
        str1+=' '*(height-i-1)
        k=0
        while k<width-(height-i-1)*2:
            if j==10:
                j=0
            str1+=str(count[j])
            k+=1
            j+=1
        # str1+=' '*(height-i-1)+""
        mountain_dic[i]=str1
        str1=""

    # print(mountain_dic)
    for key in mountain_dic.keys():
        if mountain_dic[key]==''or mountain_dic[key]=='\n':
            continue
        print(mountain_dic[key])


if __name__ == '__main__':
    import doctest
    doctest.testmod()
    f(6)
    f(6)
    f(6)