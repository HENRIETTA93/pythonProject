
# 打开文件
f=open("somefile.txt")

f=open("somefile.txt","+a")

# 如果文件不存在

'''
Traceback (most recent call last):
  File "G:/99_PythonProjects/pythonProject/files/_1_FileOp.py", line 1, in <module>
    f=open("somefile.txt1")
FileNotFoundError: [Errno 2] No such file or directory: 'somefile.txt1'
'''


# 文件基本方法
## 读取和写入
f=open("somefile.txt","r")
content=f.read(12)
print(content)

content=f.read()
print(content)

f=open('somefile.txt','w')
f.write('pycharm is amazing!')
# io.UnsupportedOperation: not readable
# print(f.read())

f=open('somefile.txt','r+')
print(f.read())

f.write("hello world!")
f.write("hello pyhton!")

f.close()

f=open("somefile.txt","r+")
print(f.read())
f.close()
f=open(r"somefile.txt")
print("----------------")
print(f.read())


# 随机存取
f=open(r'newfile.txt','w')
f.write('1234567890')
print(f.seek(5))
f.write('hello world!\n')
f.close()

f=open(r'newfile.txt')
print(f.read())

print(f.tell())
f.close()

# 读取和写入行
'''
readline
readlines
'''
f=open(r'newfile.txt')
print(f.readlines())
f.close()


with open("somefile.txt",'r+') as somefile:
    try:
        print(somefile.readlines())
        somefile.writelines(["henrietta"," try ", "hard!"])
    finally:
        somefile.close()

with open(r"somefile.txt") as somefile:
    print(somefile.readlines())




# 迭代文件内容
f=open("newfile.txt","a")
f.write("welcome to python")
with open(r"newfile.txt") as f:
    for line in f.readlines():
        print(line)

#

def process(string):
    print("Processing:", string)


import fileinput
for line in fileinput.input("newfile.txt"):
    process(line)

with open("newfile.txt") as f:
    for line in f:
        process(line)

lines=list(open("newfile.txt"))
print(lines)

lines=list(open("newfile.txt","rb"))
print(lines)
