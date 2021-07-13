def generateCalendarFirstDay(dic,mNumber,monthDic):
    first=dic[1][1]
    totaldays=0
    for m, days in monthDic.items():
        if m==mNumber:
            break
        else:
            totaldays+=monthDic[m]

    if (totaldays%7+first)%7==0:
        return 7
    else:
        return (totaldays%7+first)%7



def main():
    dic = {1: {1: 3}}
    monthNum = {"January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6, "July": 7, "August": 8,
                "September": 9, "October": 10, "November": 11, "December": 12}

    monthDic = {1: 31, 2: 29, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31,
                9: 30, 10: 31, 11: 30, 12: 31}

    while True:
        month = input("please enter a month in its full name or -l to end: ")
        if month == '-l':
            break
            exit(0)
        mNumber = 0
        try:
            mNumber = monthNum[month]

        except:
            print("It's not a valid month name")
            exit(0)

        monthFirstDay = generateCalendarFirstDay(dic, mNumber, monthDic)



        calander=['S','M','T','W','T','F','S']


        if monthFirstDay%7>0:
            for n in range(monthFirstDay%7):
                calander.append(" ")

        for i in range(monthDic[mNumber]):
            calander.append(i+1)

        count=0
        strcal=""
        for _ in calander:
            if count==7:
                print(strcal)
                count=1
                strcal=""
                strcal+="{0:>4}".format(str(_))
            else:
                strcal+='{0:>4}'.format(str(_))
                count+=1
        print(strcal)



        # listS1=['S']
        # listM=['M']
        # listT1=['T']
        # listW=['W']
        # listT2=['T']
        # listF=['F']
        # listS2=['S']
        #
        # for i in range(monthDic[mNumber]):
        #     if (i+monthFirstDay)%7==0:
        #         listS1.append(i+1)
        #     elif (i+monthFirstDay)%7==1:
        #         listM.append(i+1)
        #     elif (i+monthFirstDay)%7==2:
        #         listT1.append(i+1)
        #     elif (i+monthFirstDay)%7==3:
        #         listW.append(i+1)
        #     elif (i+monthFirstDay)%7==4:
        #         listT2.append(i+1)
        #     elif (i+monthFirstDay)%7==5:
        #         listF.append(i+1)
        #     elif (i+monthFirstDay)%7==6:
        #         listS2.append(i+1)
        #
        # calander=[]
        # calander.append(listS1)
        # calander.append(listM)








main()
