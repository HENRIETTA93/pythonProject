def not_like_the_others(lst1,lst2):
    x1=None
    x2=None
    i1=0
    i2=0
    typetuple=[]
    for item in lst1:
        if type(item) not in typetuple:
            typetuple.append(type(item))

    for i in range(0,len(lst1)):
        if typetuple.index(type(lst1[i]))==0:
            continue
        else:
            x1=lst1[i]
            i1=i
    for i in range(0,len(lst2)):
        if typetuple.index(type(lst2[i]))==1:
            continue
        else:
            x2=lst2[i]
            i2=i

    lst1[i1]=x2
    lst2[i2]=x1


# def not_like_the_others(lst1,lst2):
#     newlst1=[]
#     newlst2=[]
#     typetuple=[]
#     for item in lst1:
#         if type(item) not in typetuple:
#             typetuple.append(type(item))
#
#     for item in lst1:
#         if typetuple.index(type(item))==0:
#             newlst1.append(item)
#         else:
#             newlst2.append(item)
#     for item in lst2:
#         if typetuple.index(type(item))==0:
#             newlst1.append(item)
#         else:
#             newlst2.append(item)
#     lst1=newlst1
#     lst2=newlst2
#     return

lst1=[1,2,'three']
lst2=['one','two',3]

not_like_the_others(lst1,lst2)
print(lst1)
print(lst2)