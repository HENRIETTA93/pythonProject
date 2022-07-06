"""Stamps question"""

from stamp import Stamp

def main():

    f=open("stamp_data.txt","r")
    stamp_content=f.read()

    stamp_list=stamp_content.split("\n")
    stamp_size=len(stamp_list)
    countries = {}
    rare=0
    for stp in stamp_list:
        if stp[-1]=='*':
          rare+=1

        stmp_datas=stp.split(",")
        if stmp_datas[0] not in countries.keys():
            countries[stmp_datas[0]]=1
        else:
            countries[stmp_datas[0]]+=1


    max=0
    most_country=''
    for country in countries:
        if int(countries[country])>max:
            max=int(countries[country])
            most_country=country


    fw=open("out_put.txt","w")
    fw.write("You have "+str(stamp_size)+" stamps ("+ str(rare)+" rare).\n")
    fw.write("Stamps with most number of denominations are from "+most_country+"\n")
    fw.write("You have stamps from these "+ str(len(countries))+ " countries:\n")

    country_list=list(countries.keys())
    country_list.sort()
    i=1
    for c in country_list:
        if i!=len(country_list):
            fw.write(c+",")
        else:
            fw.write(c+"\n")
        i+=1

    fw.write("Today's random stamp is:")
    import random



    # print(stamp_content)


main()
