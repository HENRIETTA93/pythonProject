
def reverse_dict(dictionary):
    assert type(dictionary)==dict
    res={}
    for key in dictionary.keys():
        val=dictionary[key]
        if val not in res.keys():
            res[val]=[key]
        else:
            res[val].append(key)
    res=dict(sorted(res.items(),key=lambda x:x[0],reverse=False))
    return res

dic1={'A':'Cat1','B':'Cat1','C':'Cat3','F':'Cat2','G':'Cat1','D':'Cat1','E':'Cat2'}

dic2=reverse_dict(dic1)
print(dic2)
# # 定义一个字典
#
# dic = {'Name': '张三', 'Gender': '男', 'Age': 20, 'Height': 177}
#
# # for 循环遍历字典内容
#
# for i in dic:
#     print(i, ' : ', dic[i])
#
# print('===' * 26)
#
# # dic.keys 遍历
#
# print(type(dic.keys()))  # 打印 dic.keys() 得到的数据类型
#
# for i in dic.keys():
#     print(i, ' : ', dic[i])
#
# print('===' * 26)
#
# # dic.values() 遍历
#
# print(type(dic.values()))
#
# for i in dic.values():
#     print(i)
#
# print('===' * 26)
#
# # dic.items() 遍历
#
# print(dic.items())
#
# for i in dic.items():  # 使用二次循环进行遍历，第一次获得元组的内容，第二次获得具体的值
#
#     for j in i:
#         print(j, end=' : ')
#
#     print()