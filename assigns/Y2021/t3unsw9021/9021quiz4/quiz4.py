import sys


def encode(list_of_integers):
    strlst=[]
    count=0
    for sint in list_of_integers:
        bin_int=bin(sint)[2 :]
        str_bin=str(bin_int)

        for s in str_bin:
            strlst.append(s)
            strlst.append(s)
        if count!=len(list_of_integers)-1:
            strlst.append('0')
        count+=1
    # print(''.join(strlst))
    return int(''.join(strlst),2)
    pass
    # REPLACE pass ABOVE WITH YOUR CODE


def decode(integer):
    bin_integer=bin(integer)[2 :]
    # print(bin_integer)
    lists=list(bin_integer)
    # print(lists)

    if len(lists)==1:
        return
    new_list=[]
    i=0
    j=1
    while i<len(lists) and j<len(lists):
        if lists[i]==lists[j]:
            new_list.append(''.join(lists[i]+lists[j]))
            i+=2
            j+=2
        else:
            if lists[i]=='1':
                return
            else:
                if i!=len(lists)-1:
                    new_list.append(lists[i])
                    i+=1
                    j+=1
                else:
                    return
    if i<len(lists):
        return

    slist=[]
    sarray=[]
    for s in new_list:
        if s=='11':
            slist.append('1')
        if s=='00':
            slist.append('0')
        if s=='0':
            sarray.append(slist)
            slist=[]
    sarray.append(slist)

    # print(new_list)
    # print(sarray)

    result=[]
    for slst in sarray:
        int_bin=int(''.join(slst),2)
        result.append(int_bin)
    return result


    pass
    # REPLACE pass ABOVE WITH YOUR CODE


# We assume that user input is valid. No need to check
# for validity, nor to take action in case it is invalid.
print('Input either a strictly positive integer')
the_input = eval(input('or a nonempty list of strictly positive integers: '))
if type(the_input) is int:
    print('  In base 2,', the_input, 'reads as', bin(the_input)[2 :])
    decoding = decode(the_input)
    if decoding is None:
        print('Incorrect encoding!')
    else:
        print('  It encodes: ', decode(the_input))
else:
    print('  In base 2,', the_input, 'reads as',
          f'[{", ".join(bin(e)[2: ] for e in the_input)}]'
         )
    print('  It is encoded by', encode(the_input))

# while True:
#     print('Input either a strictly positive integer')
#     the_input = eval(input('or a nonempty list of strictly positive integers: '))
#     if type(the_input) is int:
#         print('  In base 2,', the_input, 'reads as', bin(the_input)[2:])
#         decoding = decode(the_input)
#         if decoding is None:
#             print('Incorrect encoding!')
#         else:
#             print('  It encodes: ', decode(the_input))
#     else:
#         print('  In base 2,', the_input, 'reads as',
#               f'[{", ".join(bin(e)[2:] for e in the_input)}]'
#               )
#         print('  It is encoded by', encode(the_input))

# while True:
#     print('Input either a strictly positive integer')
#     the_input = eval(input('or a nonempty list of strictly positive integers: '))
#     if type(the_input) is int:
#         print('  In base 2,', the_input, 'reads as', bin(the_input)[2:])
#         decoding = decode(the_input)
#         if decoding is None:
#             print('Incorrect encoding!')
#         else:
#             print('  It encodes: ', decode(the_input))
#     else:
#         print('  In base 2,', the_input, 'reads as',
#               f'[{", ".join(bin(e)[2:] for e in the_input)}]'
#               )
#         print('  It is encoded by', encode(the_input))

# while True:
#     print('Input either a strictly positive integer')
#     the_input = eval(input('or a nonempty list of strictly positive integers: '))
#     if type(the_input) is int:
#         print('  In base 2,', the_input, 'reads as', bin(the_input)[2:])
#         decoding = decode(the_input)
#         if decoding is None:
#             print('Incorrect encoding!')
#         else:
#             print('  It encodes: ', decode(the_input))
#     else:
#         print('  In base 2,', the_input, 'reads as',
#               f'[{", ".join(bin(e)[2:] for e in the_input)}]'
#               )
#         print('  It is encoded by', encode(the_input))
