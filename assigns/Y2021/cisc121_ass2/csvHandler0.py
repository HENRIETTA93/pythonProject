
''''
csvHandler module:
csv file read and write module
'''
def readCSV(filename):
    '''
    read csv file dataset into list
    :param filename:
    :return:
    '''
    f=open(filename,"r",encoding="UTF-8-sig")
    fileContent=f.read()

    content_lst=fileContent.split()
    res_content_lst=[]
    for lst in content_lst:
        tmp_lst=lst.split(",")
        res_content_lst.append(tmp_lst)
    return res_content_lst


def writeCSV(filename, records):
    '''
    output the final result to a file
    :param filename:
    :param records:
    :return:
    '''
    with open(filename,"w+",encoding="UTF-8-sig") as f:
        try:
            for rec in records:
                f.write(",".join(rec)+"\n")
        finally:
            f.close()


