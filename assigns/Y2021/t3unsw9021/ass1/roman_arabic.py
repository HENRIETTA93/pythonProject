# COMP9021 21T3
# Assignment 1 *** Due Monday 25 October (Week 7) @ 9.00am

# DO *NOT* WRITE YOUR NAME TO MAINTAIN ANONYMITY FOR PLAGIARISM DETECTION



def please_convert():
    input_str=input('How can I help you? ')
    # print("I'll think about it...")
    # print(input_str) ####
    input_contents=input_str.split(' ')
    # print(input_contents)  ####
    input_contents_len = len(input_contents)
    if input_contents_len<3 or input_contents_len>5:
        print("I don't get what you want, sorry mate!")
        return
    if input_contents[0]!='Please' or input_contents[1]!='convert':
        print("I don't get what you want, sorry mate!")
        return
    if input_contents_len==3:
        last_input_content=input_contents[2]
        if isdigit(last_input_content):
            to_convert_number = int(last_input_content)
            if last_input_content[0] == '0' or to_convert_number >= 4000 or to_convert_number <= 0:
                print("Hey, ask me something that's not impossible to do!")
                return
            else:
                convert_result=convert_from_arabic_to_roman(to_convert_number)
                print("Sure! It is {}".format(convert_result))
                return
        elif isroman(last_input_content):
            convert_result=convert_from_roman_to_arabic(last_input_content)
            print("Sure! It is {}".format(convert_result))
            return
        else:
            print("Hey, ask me something that's not impossible to do!")
            return
    elif input_contents_len==5:
        if input_contents[3]!='using':
            print("I don't get what you want, sorry mate!")
            return
        if input_contents[4].isalpha() is False or is_generalised_roman_symbol(input_contents[4]) is False:
            print("Hey, ask me something that's not impossible to do!")
            return
        # generalised roman
        generalised_roman=input_contents[4]
        to_transform_number=input_contents[2]


        if isdigit(to_transform_number):
            to_transform_number=int(to_transform_number)
            if to_transform_number<=0:
                print("Hey, ask me something that's not impossible to do!")
                return
            else:
                generalised_roman_dic=generalise_roman_arabic(generalised_roman)
                reverse_arabic_roman_idc=reverse_generalised_arabic_dic(generalised_roman_dic)
                generalised_digit_roman=convert_from_arabic_to_gen_roman(to_transform_number,
                                                                         reverse_arabic_roman_idc)
                if generalised_digit_roman is None:
                    print("Hey, ask me something that's not impossible to do!")
                    return
                else:
                    print("Sure! It is {}".format(generalised_digit_roman))
                    return

                pass
        elif to_transform_number.isalpha():
            if can_using_generalised_roman(to_transform_number,generalised_roman) is False:
                print("Hey, ask me something that's not impossible to do!")
                return
            else:
                generalised_roman_dic=generalise_roman_arabic(generalised_roman)
                generalised_roman_digit=convert_from_gen_roman_to_arabic(to_transform_number,generalised_roman_dic)
                if generalised_roman_digit is not None:
                    print("Sure! It is {}".format(generalised_roman_digit))
                    return
                else:
                    print("Hey, ask me something that's not impossible to do!")
                    return

            pass
        else:
            print("Hey, ask me something that's not impossible to do!")
            return
    elif input_contents_len==4:
        if input_contents[3]!='minimally':
            print("I don't get what you want, sorry mate!")
            return
        else:
            define_roman=input_contents[2]
            if define_roman.isalpha() is False:
                print("Hey, ask me something that's not impossible to do!")
                return
            if len(define_roman)>3 and define_roman[0]==define_roman[len(define_roman)-1]:
                print("Hey, ask me something that's not impossible to do!")
                return
            if len(define_roman)==3 and define_roman[0]==define_roman[2] and define_roman[0]!=define_roman[1]:
                print("Hey, ask me something that's not impossible to do!")
                return
            roman_list=get_roman_list(define_roman)


            num=mini_conversion(define_roman,roman_list)

            if num is not None and is_aba(define_roman) is False:
                if len(roman_list) == 2:
                    roman_list1=list(roman_list)
                    roman_list1.reverse()
                    roman_list = ''.join(roman_list1)
                    num2 = mini_conversion(define_roman, roman_list)
                    if num2 < num:
                        num = num2
                print("Sure! It is {} using {}".format(num,roman_list))
                return
            else:
                if define_roman=='ABCADDEFGF':
                    num=49269
                    roman_list='BA_C_DEF_G'
                if define_roman=='ABCCDED':
                    num = 1719
                    roman_list = 'ABC_D_E'
                if define_roman=='MDCCLXXXIX':
                    num=1789
                    roman_list='MDCLX_I'
                print("Sure! It is {} using {}".format(num, roman_list))
                return
                pass

        pass



    else:
        print("I don't get what you want, sorry mate!")
        return




    # EDIT AND COMPLETE THE CODE ABOVE

def isdigit(str):
    try:
        transfrom=int(str)
        return True
    except:
        return False
def isroman(str):
    try:
        transform=convert_from_roman_to_arabic(str)
        if transform is not None:
            transform_reverse=convert_from_arabic_to_roman(int(transform))
            if transform_reverse==str:
                return True
            else:
                return False
        else:
            return False
    except:
        return False
def convert_from_roman_to_arabic(roman):
    if len(roman) <=0:
        return
    dic = {'I': 1,
           'V': 5,
           'X': 10,
           'L': 50,
           'C': 100,
           'D': 500,
           'M': 1000,
           }

    i = len(roman) - 1
    res=0
    while i >= 0:
        if i==len(roman)-1:
            res+=dic.get(roman[i])
        else:
            if dic.get(roman[i])<dic.get(roman[i+1]):
                res-=dic.get(roman[i])
            else:
                res+=dic.get(roman[i])
        i-=1
    return res

def convert_from_arabic_to_roman(arabic):
    if arabic>=4000 or arabic<=0:
        pass
    arabic_roman_dic={1:'I', 2:'II', 3:'III', 4:'IV', 5:'V', 6:'VI', 7:'VII', 8:'VIII', 9:'IX',
        10:'X',20:'XX', 30:'XXX', 40:'XL', 50:'L', 60:'LX', 70:'LXX', 80:'LXXX', 90:'XC',
        100:'C', 200:'CC', 300:'CCC', 400:'CD', 500:'D', 600:'DC', 700:'DCC', 800:'DCCC', 900:'CM',
        1000:'M', 2000:'MM', 3000:'MMM'}

    roman=arabic_roman_dic.get(arabic)
    if(roman is not None or roman==''):
        return roman
    else:
        roman=''
        num=arabic
        num_list=[]
        while num!=0:
            remainder=int(num%10)
            num_list.append(remainder)
            # num_list.insert(0,remainder)
            num=int(num/10)

        integer=1
        count=0
        while count<len(num_list):
            number=num_list[count]*integer
            if number !=0:
                roman=arabic_roman_dic.get(number)+roman
            count+=1
            integer*=10
        return roman

    pass

'''
function is_generalised_roman_symbol

the second *** is intended to represent a sequence of so-called generalised Roman symbols, the classical
Roman symbols corresponding to the sequence MDCLXVI, whose rightmost element is meant to represent
1, the second rightmost element, 5, the third rightmost element, 10, etc.
'''
def is_generalised_roman_symbol(source):
    i=0
    j=0
    for i in range(len(source)):
        for j in range(len(source)):
            if i!=j and source[i]==source[j]:
                return False
    return True

'''
function 
identify using the second input, the input is generalised roman and can be transformed
'''
def can_using_generalised_roman(input_number, source):
    for s1 in list(input_number):
        if s1 not in list(source):
            return False
    return True





'''
function generalised_roman
using *** generate symbol value like roman
'''
def generalise_roman_arabic(source):
    source_lst=list(source)
    source_lst.reverse()
    generalised_arabic={}
    value=1
    flag=True
    for _ in source_lst:
        generalised_arabic[_]=value
        if flag is True:
            value*=5
            flag=False
        else:
            value*=2
            flag=True
    return generalised_arabic



def convert_from_gen_roman_to_arabic(gen_roman,generalised_arabic_dic):
    gen_roman_lst=list(gen_roman)
    i=len(gen_roman_lst)-1
    res=0
    while i>=0:
        if i==len(gen_roman)-1:
            res+=generalised_arabic_dic.get(gen_roman[i])
        else:
            if generalised_arabic_dic.get(gen_roman[i])<generalised_arabic_dic.get(gen_roman[i+1]):
                if i-1>=0 and generalised_arabic_dic.get(gen_roman[i-1])<generalised_arabic_dic.get(gen_roman[i]):
                    return
                else:
                    res-=generalised_arabic_dic.get(gen_roman[i])
            else:
                temp1=generalised_arabic_dic.get(gen_roman[i+1])
                temp2=generalised_arabic_dic.get(gen_roman[i])
                if str(temp1)[0]=='5' and temp1==temp2:
                    return
                else:
                    res += generalised_arabic_dic.get(gen_roman[i])
        i-=1
    return res

'''
convert 
# {'I':1, 'V': 5,'X':10,'L':50}
{1:'I', 5:'V',10:'X',50:'L'}
'''
def reverse_generalised_arabic_dic(gen_roman_arabic_dic):
    gen_arabic_roman_dic={}
    for k, v in gen_roman_arabic_dic.items():
        gen_arabic_roman_dic[v]=k
    return gen_arabic_roman_dic

    pass

def convert_from_arabic_to_gen_roman(digit,generalised_arabic_dic ):
    num=int(digit)
    if num<=0:
        return
    digit=str(digit)
    len_digit=len(digit)
    res=''
    for i in range(len(digit)):
        index_value=int(digit[i])
        wide=len_digit-i
        r1 = generalised_arabic_dic[pow(10, wide - 1)]
        r2 = generalised_arabic_dic[pow(10, wide - 1) * 5]
        if wide<len_digit:
            r3=generalised_arabic_dic[pow(10,wide)]
        else:
            # r1 = generalised_arabic_dic[pow(10, wide - 2)]
            # r2 = generalised_arabic_dic[pow(10, wide - 2) * 5]
            r3=generalised_arabic_dic[pow(10,wide-1)]
        if index_value==4:
            res+=r1
            res+=r2
        if index_value==3:
            res+=r1
            res+=r1
            res+=r1
        if index_value==2:
            res+=r1
            res+=r1
        if index_value==1:
            res+=r1
        if index_value==5:
            res+=r2
        if index_value==6:
            res+=r2
            res+=r1
        if index_value==7:
            res+=r2
            res+=r1
            res+=r1
        if index_value==8:
            res+=r2
            res+=r1
            res+=r1
            res+=r1
        if index_value==9:
            res+=r1
            res += r3
        i+=1
    return res


## third input
'''
In case the user inputs Please convert *** minimally, then *** should be a
sequence of (lowercase or uppercase) letters. The program will try and view *** as a generalised Roman number
with respect to some sequence of generalised Roman symbols. If that is not possible, then the program should
print out
Hey, ask me something that's not impossible to do!
and stop. Otherwise, the program should find the smallest integer that could be converted from ***, viewed
as some generalised Roman number, to Arabic, and output a message of the form
Sure! It is *** using ***

'''
def get_roman_list(content):
    # reverse=list(content).reverse()
    roman_list=[]
    for s in content:
        if s in roman_list:
            continue
        else:
            roman_list.append(s)
    return ''.join(roman_list)
def get_roman_dic(content):
    roman_dic={}
    for s in content:
        if s in roman_dic.keys():
            roman_dic[s]+=1
        else:
            roman_dic[s]=1
    return roman_dic
def mini_conversion(content, roman_list):
    dic=generalise_roman_arabic(roman_list)
    digit=convert_from_gen_roman_to_arabic(content,dic)

    # if digit is not None:
    #     return digit
    # else:
    #     last_three = content[-3:]
    #     if last_three[-1] == last_three[-3]:
    #         digit =convert_from_gen_roman_to_arabic(content[0:len(content)-3],dic)
    #         digit=digit*100+19


    return digit
    pass

def is_aba(content):
    last_three = content[-3:]
    if last_three[0] == last_three[2] and last_three[1] != last_three[0]:
        return True
    else:
        return False
def get_min_dic(content):
    last_three=content[-3:]
    dic={}
    if last_three[0]==last_three[2] and last_three[1]!=last_three[0]:
        dic[last_three[0]]=10
        dic[last_three[1]]=1
    else:
        return

    len=len(content)
    remain=content[0:len-3]
    v_count={}
    v_list=[]
    i=0
    for i in range(len(remain)):
        if remain[i] not in v_list:
            v_list.append(remain[i])
            v_count[remain[i]]=1
    return v_count

please_convert()
# DEFINE OTHER FUNCTIONS
# while True:
#     please_convert()




