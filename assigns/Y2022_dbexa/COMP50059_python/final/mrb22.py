lst1 = [1, 2, 3, 4]
lst1_duplication = [item for item in lst1]
lst2 = [(item * 2) for item in lst1]

print(lst1)
print(lst1_duplication)
print(lst2)

import copy
old_list = [1, 2, 3, 4]
new_list = copy.copy(old_list)
old_list[3] = 'four'
new_list.append(5)
print("old_list:", old_list)
print(id(old_list))
print()
print("new_list:", new_list)
print(id(new_list))


import copy
old_list = [123, ['four', 5, 6], [7, 8, 9]]
new_list = copy.copy(old_list)
old_list.append([10])
new_list.append([11])
old_list[1][0] = 4
old_list[0] = 321
print("old_list:", old_list)
print(id(old_list))
print()
print("new_list:", new_list)
print(id(new_list))


import copy
old_list = [[1, 2, 3], ['four', 5, 6], [7,
8, 9]]
new_list = copy.deepcopy(old_list)
old_list.append([10])
new_list.append([11])
old_list[1][0] = 4
print("old_list:", old_list)
print("new_list:", new_list)

x=True
y=False
print(x-y)
# print(old_list-new_list)
# print('1232'-'fdas')

print(bool(00)==False)
print(bool('False')==False)

print([x for x in range(1,101) if x%3==0])
data=open("11.txt",'a')
# print(data.readline())
old_list.reverse()
print(old_list)
print(3*True)

# print(100/old_list[100])
cnt="1".count("abc")
print(cnt)

print(range(-8))

lst=[1,2,3]
print(id(lst))
lst.reverse()
print(lst)
print(id(lst))
print(lst[::-1])
print(id(lst[::-1]))
lst1=sorted(lst,reverse=True)
print(lst1)
print(id(lst1))
# rsort(lst)

# print(100/lst[100])
astr='abc'
print(astr.count('abc'))