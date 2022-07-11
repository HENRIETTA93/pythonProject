

def read_files(inputFile1, inputFile2):
    try:
        f = open(inputFile1, "r")
        content1 = f.read()
        f2 = open(inputFile2, "r")
        content2 = f2.read()
    except:
        print("not a file!")
    lists_info=content1.split("\n")
    template=content2.split("\n")
    return lists_info,template


content=read_files("result.txt","email.txt")
lists_info=content[0]
template=content[1]
print(lists_info)
print(template)



### 6b
cheers="Cheers\n"+\
       "Program Chairs"
def author_notification(info, template):
    avg_score = {}
    is_accepted={}
    for inf in info:
        info_lst=inf.split(', ')
        if info_lst[1]!='ICLR2022':
            continue

        if len(info_lst)==3:
            sum_score=0
            llen=0
            more_than_7=False
            for i in info_lst[2]:
                if i !='(' and i!=',' and i!=')':
                    ii = int(i)
                    sum_score += ii
                    if ii>=7:
                        more_than_7=True
                    llen+=1
            avg=sum_score/llen
            avg_score[info_lst[0]]=avg
            if (more_than_7 is True) and avg_score[info_lst[0]] >= 6:
                is_accepted[info_lst[0]] = True

        if len(info_lst)==4:
            sum_score1 = 0
            sum_score2=0
            len1 = 0
            len2=0
            more_than_71 = False
            more_than_72 = False
            for i in info_lst[2]:
                if i != '(' and i != ',' and i != ')':
                    ii = int(i)
                    sum_score1 += ii
                    len1+=1
                    if ii>=7:
                        more_than_71=True
            avg1 = sum_score1 / len1
            for i in info_lst[3]:
                if i != '(' and i != ',' and i != ')':
                    ii = int(i)
                    sum_score2 += ii
                    len2+=1
                    if ii>=7:
                        more_than_72=True
            avg2= sum_score2 / len2
            if avg1>=avg2:
                avg_score[info_lst[0]] = avg1
            else:
                avg_score[info_lst[0]]=avg2
            if (more_than_71 is True or more_than_72 is True) and avg_score[info_lst[0]]>=6:
                is_accepted[info_lst[0]]=True

    for key in is_accepted.keys():
        if is_accepted[key] is True:
            f=open(r''+key+'.txt','w')
            f.write("Desicition on submission "+key+".\n")
            f.write(template[1]+"\n")
            f.write(cheers)
        else:
            f = open(r'' + key + '.txt', 'w')
            f.write("Desicition on submission " + key + ".\n")
            f.write(template[0]+"\n")
            f.write(cheers)
    # print(avg_score)


    pass


author_notification(lists_info, template)
