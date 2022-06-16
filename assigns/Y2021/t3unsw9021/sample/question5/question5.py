# COMP9021 21T3 - Rachid Hamadi
# Sample Exam Question 5


'''
Will be tested with year between 1913 and 2013.
You might find the reader() function of the csv module useful,
but you can also use the split() method of the str class.
'''

import csv

def f(year):
    '''
    >>> f(1914)
    In 1914, maximum inflation was: 2.0
    It was achieved in the following months: Aug
    >>> f(1922)
    In 1922, maximum inflation was: 0.6
    It was achieved in the following months: Jul, Oct, Nov, Dec
    >>> f(1995)
    In 1995, maximum inflation was: 0.4
    It was achieved in the following months: Jan, Feb
    >>> f(2013)
    In 2013, maximum inflation was: 0.82
    It was achieved in the following months: Feb
    '''
    months = 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    # Insert your code here
    f=open("cpiai.csv","r")
    f_content=f.read()
    flines=f_content.split("\n")
    dic = {}
    for line in flines[1:]:
        yyyy=line[0:4]
        month=line[5:7]
        arrs=line.split(",")

        inflation=arrs[-1]
        # dic[year][month]=inflation
        if yyyy not in dic.keys():
            dic[yyyy]={}
            if 'max' not in dic[yyyy].keys():
                dic[yyyy]['max']=inflation
            else:
                if float(inflation)>float(dic[yyyy]['max']):
                    dic[yyyy]['max']=inflation
            if month not in dic[yyyy].keys():
                dic[yyyy][month]=[inflation]
            else:
                dic[yyyy][month].append(inflation)


        else:
            if 'max' not in dic[yyyy].keys():
                dic[yyyy]['max']=inflation
            else:
                if float(inflation)>float(dic[yyyy]['max']):
                    dic[yyyy]['max']=inflation
            if month not in dic[yyyy].keys():
                dic[yyyy][month]=[inflation]
            else:
                dic[yyyy][month].append(inflation)

    year_key=str(year)
    year_dic=dic[year_key]
    max_inflation=year_dic['max']
    month_inf=[]
    for m in year_dic.keys():
        if m!='max' and max_inflation==year_dic[m][0]:
            mm=int(m)
            month_inf.append(months[mm-1])

    print('In '+str(year)+', maximum inflation was: '+max_inflation)
    strs='It was achieved in the following months: '
    for i in month_inf:
        strs+=i+', '
    print(strs[:-2])

    # print(max_inflation, month_inf)

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    # f(1914)
    # f(1914)
    # f(1914)