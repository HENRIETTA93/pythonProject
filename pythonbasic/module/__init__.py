# 标准库
'''
import math
math.sin(0)



--标准库--
sys
模块sys能够访问与python解释器紧密相关的变量和函数
argv
exit([argv])
modules:一个字典，将模块名映射到加载的模块
path: 一个列表,包含要在其中查找模块的目录名称
platform：一个平台标识符
stdin:
stdout
stderr

os
访问多个操作系统服务

fileinput
input([files[, inplace[, backup]]]): 帮助迭代多个输入流中的行
filename(): 返回当前文件的名称
lineno(): 返回(累计的)当前行号
filelineno(): 返回在当前文件中的行号
isfirstline():
isstdin():
nextfile():
close()


time
模块time包含用于获取当前时间、操作时间和日期、从字符串读取日期、将日期格式化为字符串的函数

asctime([tuple]): 将时间元组转换为字符串
localtime([secs]): 将秒数转换为表示当地时间的日期元组
mktime(tuple): 将时间元组转换为当地时间
sleep(secs): 休眠secs秒
strptime(string[, format]): 将字符串转换为时间元组
time(): 当前时间


random
模块random包含生成伪随机数的函数
random(): 返回一个0~1(含)的随机实数
getrandbits(n): 以长整数方式返回n个随机的二进制位
uniform(a,b): 返回一个a~ass2_1(含)的随机实数
randrange([start],stop,[step]): 从range(start,stop,step)中随机选择一个数
choice(seq): 从序列seq中随机地选择一个元素
shuffle(seq[,random]): 就地打乱序列seq
sample(seq,n): 从序列seq中随机地选择n个值不同的元素
'''

