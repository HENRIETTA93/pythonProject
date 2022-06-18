
def can_merge(string_1, string_2, string_3):
    if not string_1:
        return string_2 == string_3
    if not string_2:
        return string_1 == string_3
    if string_1[0] == string_3[0]\
       and can_merge(string_1[1 :], string_2, string_3[1 :]):
        return True
    if string_2[0] == string_3[0]:
       return can_merge(string_1, string_2[1 :], string_3[1 :])
    return False

def report_failure():
    print('No string can be merged from the other two.')

ranks = 'first', 'second', 'third'  
shortest, in_between, longest =\
    sorted(zip(ranks,
               (input(f'Please input the {rank} string: ') for rank in ranks),
              ), key=lambda x: len(x[1])
          )
if not longest[1]:
    print('Any string can be obtained from the other two.')
elif not shortest[1]:
    if in_between[1] == longest[1]:
        print(f'The {in_between[0]} and {longest[0]} strings can be obtained '
              'by merging the other two.'
             )
    else:
        report_failure()
elif len(longest[1]) != len(shortest[1]) + len(in_between[1])\
   or not can_merge(shortest[1], in_between[1], longest[1]):
    report_failure()
else:
    print(f'The {longest[0]} string can be obtained by merging the other two.')
