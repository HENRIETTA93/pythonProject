# ### 抽象 #####

# 自定义函数
'''
def: 定义函数
return: 从函数返回值
要判断某个对象是否可调用，用内置函数 callable

'':给函数添加文档字符串(docstring)
__doc__: 是函数的一个属性

如果没有指定函数返回值，即不包含return语句或者return未指定返回值，则返回None

参数--参数存储在局部作用域内
字符串、数和元组是不可变的：-只给局部变量赋了新值
可变数据结构：如列表--修改了变量关联的列表

将同一个列表赋给两个变量时，这两个变量同时指向这个列表，要避免这样的结果，必须创建列表的副本。
对序列执行切片操作时，返回的切片都是副本。
eg：
names=['Mrs. Entity','Mrs. Thing']
n=names[:]

print(n is names)--False
print(n==names)--True

关键字参数--使用名称指定的参数

收集参数
分配参数

'''

# ###### 类 #######
'''
polymorphism-多态

encapsulation-封装-对外部隐藏有关对象工作原理的细节

继承-基于通用类创建出专用类


## 创建自定义类
如果使用python 2, 请包含：
__metaclass__=type


class Person:
    def set_name(self,name):
        self.name=name
    
    def get_name(self):
        return self.name
    
    def greet(self):
        print("Hello, world! I'm {}.".format(self.name))

# self: 指向对象本身


## 属性、函数和方法
方法和函数的区别：参数self，方法（关联的方法）将第一个参数关联到它所属的实例



## 多个超类


## 抽象基类


函数

callable(object):判断对象是否是可调用的(是否函数或方法)
getattr(object,name[,default]) 获取属性值，可以提供默认值
hasattr(object,name) 确定对象是否有指定的属性
isinstance(object,class) 确定对象是否是指定的实例
issubclass(A, B) 确定A是否是B的子类
random.choice(sequence) 从一个非空序列中随机地选择一个元素
setattr(object,name,value) 将对象的指定属性设置为指定的值
type(object) 返回对象的类型

'''