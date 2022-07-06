"""
musicians question (using original.txt)
"""

musicians=open('original.txt','r')
content=musicians.read()
content=content.strip()

new_content=[]
content_lst=content.split("\n")

new_content.append(content_lst[0])
names=[]

for i in range(1,len(content_lst)):
    datas=content_lst[i].split(',')
    births=datas[1].split('/')
    birth=births[2]+'-'+births[1]+'-'+births[0]
    new_content.append((datas[0],birth))
    names.append(datas[0])

names.sort()

target_content=[]
target_content.append(new_content[0])
for i in range(len(names)):
    name=names[i]
    for t in new_content:
        if name==t[0]:
            target_content.append(t[1]+' = '+t[0])

# print(target_content)


f=open('sample_musicians.txt','w')
for t in target_content:
    f.write(t+'\n')
