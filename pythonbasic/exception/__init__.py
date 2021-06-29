# 异常 #

## 自主引发异常
'''
raise 语句
将一个类(必须是Exception子类)或实例作为参数
raise Exception

一些内置异常类
Exception
AttributeError
OSError
KeyError
NameError
SyntaxError
TypeError
ValueError
ZeroDivisionError

自定义异常类
'''

## 捕获异常
'''
try/except

捕获异常后，如果需要重新引发它（继续向上传播）,可调用raise 且不提供任何参数, 也可显式地提供捕获到的异常
'''