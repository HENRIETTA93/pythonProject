
# ## clear ###

d={}
d['name']='Gumby'
d['age']=23
print(d)

returned_value=d.clear()
print(returned_value)
print(d)


# 两个场景 clear
#
print("---通过赋值空字典---")
dic1={}
dic2=dic1
dic1['key']='value'
print(dic2)
dic1={}
print(dic2)
print(dic1)

#
print("---clear---")
dic1={}
dic2=dic1
dic1['key']='value'
print(dic2)
dic1.clear()
print(dic2)
print(dic1)

print("==================copy=======================")

# ## copy ###
dicx={'username':'admin',"machines":['foo','bar','baz']}

dicy=dicx.copy()

dicy['username']='henrietta'
dicy['machines'].remove('bar')
print(dicy)
print(dicx)



print("----deepcopy-----")
from copy import deepcopy
dicx={'username':'admin',"machines":['foo','bar','baz']}

dicy=deepcopy(dicx)

dicy['username']='henrietta'
dicy['machines'].remove('bar')
print(dicy)
print(dicx)

print("====================fromkeys=====================")
# ## fromkeys ###
d={}.fromkeys(['name','age'])
print(d)

d=dict.fromkeys(['name','age'],'(unknown)')
print(d)

print("====================get=====================")
d={}
# KeyError: 'name'
# print(d['name'])

print(d.get('name'))

print(d.get('name','N/A'))


print("====================items=====================")

d={'title':'Python web site','url':'http://www.python.org','spam':0}
print(d.items())
print(type(d.items()))

it=d.items()
d['spam']=1
print(('spam',0) in it)
d['spam']=0
print(('spam',0) in it)
print(list(it))

print("====================pop=====================")

d={'x':1,'y':'100'}
print(d.pop('x'))
print(d)

print("====================popitem=====================")
d={'title':'Python web site','url':'http://www.python.org','spam':0}
print(d.popitem())
print(d)


print("====================setdefault=====================")
d={}
d.setdefault('name','N/A')
print(d)
d['name']='Henrietta'
print(d)

print("====================update=====================")
d={'title':'Python web site','url':'http://www.python.org','spam':0}
x={'title':'Python basic'}
print(d.update(x))
print(d)

d.update({'year':2021})
print(d)

print("====================values=====================")

d={}
d[1]=1
d[2]=2
d[3]=3
print(d.values())