flatten_list=[]
def flatten(in_list):
    for lst in in_list:
        try:
            lst1=list(lst)
            if len(lst1) == 1:
                flatten_list.append(lst1[0])
            else:
                flatten(lst1)
        except:
            flatten_list.append(lst)





in_list=[[1],[2,3],4,[3,[2,4]]]
flatten(in_list)
print(flatten_list)

flatten_list=[]
in_list=[[1],[2,3],4,[3,[2,4,[3,4,[5]]]]]
flatten(in_list)
print(flatten_list)