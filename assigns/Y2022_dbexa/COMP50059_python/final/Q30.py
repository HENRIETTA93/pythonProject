def sum_list(lst):
    if len(lst)==0:
        return 0
    else:
        return lst[0]+sum_list(lst[1:])
def sum_multi_list(mlst):
    if len(mlst)==0:
        return 0
    else:
        a=mlst[0]
        if type(a)==list:
            return a[0]+sum_multi_list(a[1:])+sum_multi_list(mlst[1:])
        else:
            return a+sum_multi_list(mlst[1:])

lst=[1,4,6]
print(sum(lst))

print(sum_multi_list([2,4,6,8]))
print(sum_multi_list([1,2,3,[4,5,6]]))
print(sum_multi_list([[5,3,8],[4,8,9]]))
print(sum_multi_list([[1],[2,[3,4,5]]]))
print(sum_multi_list([1,3,[1,2]]))