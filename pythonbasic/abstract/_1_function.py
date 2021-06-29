def hello(name):
    return 'Hello, '+name+"!"

print(hello('python'))


# fibs
def fibs(num):
    'Calculates the fibs'
    result=[0,1]
    for i in range(num-2):
        result.append(result[-2]+result[-1])
    return result

print(fibs(10))
help(fibs)
print(fibs.__doc__)


# 参数--参数存储在局部作用域内
def try_change_param(n):
    n='Mr. Gumby'

name='Mrs. Entity'
try_change_param(name)
print(name)

def change(n):
    n[0]='Mr. Gumby'

names=['Mrs. entity','Mrs. Thing']
change(names)
print(names)

names=['Mrs. Entity','Mrs. Thing']
n=names[:]

print(n is names)
print(n==names)
n1=names
print(n1 is names)

#----------------------------------------------
storage={}
storage['first']={}
storage['middle']={}
storage['last']={}

me='Magnus Lie Hetland'
storage['first']['Magnus']=[me]
storage['middle']['Lie']=[me]
storage['last']['Hetland']=[me]

print(storage['middle']['Lie'])

my_sister='Anne Lie Hetland'
storage['first'].setdefault('Anne',[]).append(my_sister)
storage['middle'].setdefault('Lie',[]).append(my_sister)
storage['last'].setdefault('Hetland',[]).append(my_sister)
print(storage)
print(storage['first']['Anne'])
print(storage['middle']['Lie'])
print('-------------------------------------------------')
#-------------------------------------------------------

def init(data):
    data['first']={}
    data['middle']={}
    data['last']={}

# storage={}
# init(storage)
# print(storage)

def lookup(data, label, name):
    return data[label].get(name)

print(lookup(storage,'middle','Lie'))

def store(data, full_name):
    names=full_name.split()  # #拆分full_name 创建一个列表
    if(len(names)==2): names.insert(1,'')
    labels='first', 'middle','last' # #'first', 'middle','last'存储在元组中
    for label, name in zip(labels,names):  # #使用函数zip将标签和对应的名字合并
        people=lookup(data,label, name)  # #获取属于该标签和名字的列表
        if people:
            people.append(full_name)
        else:
            data[label][name]=[full_name]


MyNames={}
init(MyNames)
store(MyNames,'Magnus Lie Hetland')
_=lookup(MyNames, 'middle', 'Lie')
print(_)
store(MyNames,'Robin Hood')
store(MyNames,'Robin Locksley')
print(lookup(MyNames,'first','Robin'))
store(MyNames,'Mr. Gumby')
print(lookup(MyNames,'middle',''))