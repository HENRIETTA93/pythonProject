# 打开文件
'''
调用函数open时，如果只指定文件名，将获得可读取文件对象。如果要写入文件，必须指定模式。
'r' 读取模式(默认)
'w' 写入模式
'x' 独占模式
'a' 附加模式
'b' 二进制模式(与其他模式结合使用)
't' 文本模式(默认,与其他模式结合使用)
'+' 读写模式(与其他模式结合使用)
'''

# 文件的基本方法
'''
f.read
f.write


随机存取
f.seek: seek(offset[, whence])将当前位置移动到offset和whence指定的地方
f.tell: tell()返回当前位于文件的什么位置

读取和写入行
readline
readlines
writelines: 接收一个字符串列表(可以是任何序列或可迭代对象)

关闭文件
close
try:

finally:
    file.close()
    
with open("somefile.txt") as somefile:
    do_something(somefile)
'''

# 迭代文件内容
'''
使用fileinput实现延迟行迭代


list(open(filename))可将file转换为字符串列表
'''
