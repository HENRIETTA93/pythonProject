
# Takes two strings (words) as arguments and checks
# that both consist of nothing but uppercase letters.
#
# If that is the case,
# - displays the first word horizontally,
# - displays the second word vertically,
# - displays 0 at the intersection of a row and a column
#   where the letters are different,
# - displays i at the intersection of a row and a column
#   where the letters are the same and this happens for
#   the i-th time,
#   - processing the first row from left to right,
#   - processing the second row from right to left,
#   - processing the third row from left to right,
#   - processing the fourth row from right to left,
#   - ...
# The number of digits in the maximum number i determines
# the width of columns as shown in the sample tests.
#
# You can assume that both arguments are strings.


def f(word_1, word_2):
    '''
    >>> f('AB', 'C2D')
    Both arguments should consist of nothing but uppercase letters.
    >>> f('Aa', 'BB')
    Both arguments should consist of nothing but uppercase letters.
    >>> f('AB', '')
    >>> f('AB', 'CD')
      A B
    C 0 0
    D 0 0
    >>> f('AA', 'A')
      A A
    A 1 2
    >>> f('AAA', 'AAAA')
       A  A  A
    A  1  2  3
    A  6  5  4
    A  7  8  9
    A 12 11 10
    >>> f('AAAAAAAAAAAAAAA', 'AAAAAAAA')
        A   A   A   A   A   A   A   A   A   A   A   A   A   A   A
    A   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15
    A  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16
    A  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45
    A  60  59  58  57  56  55  54  53  52  51  50  49  48  47  46
    A  61  62  63  64  65  66  67  68  69  70  71  72  73  74  75
    A  90  89  88  87  86  85  84  83  82  81  80  79  78  77  76
    A  91  92  93  94  95  96  97  98  99 100 101 102 103 104 105
    A 120 119 118 117 116 115 114 113 112 111 110 109 108 107 106
    >>> f('ABC', 'BCD')
      A B C
    B 0 1 0
    C 0 0 2
    D 0 0 0
    >>> f('ABBC', 'BCDECB')
      A B B C
    B 0 1 2 0
    C 0 0 0 3
    D 0 0 0 0
    E 0 0 0 0
    C 0 0 0 4
    B 0 6 5 0
    >>> f('ABABCDCD', 'ABDEABDE')
       A  B  A  B  C  D  C  D
    A  1  0  2  0  0  0  0  0
    B  0  4  0  3  0  0  0  0
    D  0  0  0  0  0  5  0  6
    E  0  0  0  0  0  0  0  0
    A  7  0  8  0  0  0  0  0
    B  0 10  0  9  0  0  0  0
    D  0  0  0  0  0 11  0 12
    E  0  0  0  0  0  0  0  0
    '''
    # INSERT YOUR CODE HERE        
    upper_letter=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    if word_1=='' or word_2=='':
        return
    for _ in word_1:
        if _ not in upper_letter:
            print('Both arguments should consist of nothing but uppercase letters.')
            return
    for _ in word_2:
        if _ not in upper_letter:
            print('Both arguments should consist of nothing but uppercase letters.')
            return

    len1=len(word_1)
    len2=len(word_2)
    square=[]
    first_line=[]
    first_line.append(' ')
    for i in range(len1):
        first_line.append(word_1[i])
    square.append(first_line)
    for j in range(len2):
        square.append([word_2[j]])
    i=1
    j=1
    while j<len(word_2)+1:
        line=square[j]
        while i<len(word_1)+1:
            line.append('0')
            i+=1
        i=1
        j+=1

    i=1
    while i<len(word_1)+1:
        j=1
        while j<len(word_2)+1:
            if square[0][i]==square[j][0]:
                square[j][i]='1'
            j+=1
        i+=1

    right=True
    count=1
    i=1
    while i<len(word_2)+1:
        if right is True:
            j = 1
            while j < len(word_1) + 1:
                if square[i][j] == '1':
                    square[i][j] = str(count)
                    count += 1
                j+=1
            right=False
        else:
            j=len(word_1)
            while j>=1:
                if square[i][j]=='1':
                    square[i][j]=str(count)
                    count+=1
                j-=1
            right=True
        i+=1


    # for _ in square:
    #     print(''.join(_))
    # print('\n'.join(' '.join(f'{x:>{len(str(count))}}' for x in row) for row in square))
    for row in square:
        print(' '.join(row))

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    # f('Aa', '')
    f('ABABCDCD', 'ABDEABDE')