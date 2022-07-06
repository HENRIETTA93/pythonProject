"""
CP1404 2021-53 Final Exam - Online Assignment
Name: XXX

Where needed, use additional code files.
Ensure that each question's answer is clearly identifiable.
"""


# # 7.
# # Explanation:
#
# # Code:
# # Refactor the code and explain your reasons
# length = float(input("Length? "))
# width = float(input("Width "))
# if length * width >= 30:
#     print("Room of size {} sqm => Big".format(length * width))
# elif length * width >= 10:
#     print("Medium room of size {} sqm".format(length * width))
# else:
#     print("Your room is small at only {} sqm".format(length * width))
#
#
# # 8.
# # Explanation:
#
# # Code:
# # Start with lowercase state names
# things = ["qld", "nsw", "act"]
# print("Original:", things)
#
# # Make them uppercase
# for thing in things:
#     thing = thing.upper()
# print("Uppercase names now:", things)
#
#
# # 9.
# # Code:
# def main():
#     in_file = open("data.txt")
#     data = get_data(in_file)
#     in_file.close()
#     average(data, len(data))
#
#
# def get_data(in_file):
#     values = []
#     for line in in_file:
#         values.append(float(line))
#     return values
#
#
# def average(data, length):
#     average = sum(data) / length
#     print("The average is", average)
#
#
# main()

# Explanation:


# 10.

# 11.
# def function(??
#     return x + y + z
#
#
# print(function(2, y=5))  # prints 27
# print(function(100))  # prints 125

# 12.
d = {4: "good", 1: "hello", 5: "subject", 2: "welcome", 3: "exam"}
result=[]
for key in d.keys():
    result.append(str(key)+" is " +d.get(key)[0]*key)

result.sort()
for r in result:
    print(r)

# 13.
def find_uv(data_string):
    datas = data_string.split(',')
    for data in datas:
        if data.strip()[0:2]=='uv':
            return float(data.strip()[4:-1])

data_string = "date='12/11/2020', temperature='23.1c', uv='6.43'"

uv=find_uv(data_string)
print(uv)

data_string = "uv='11.05', date='01/10/2019', temperature='9.7c'"
uv=find_uv(data_string)
print(uv)


# 14.
numbers = [10, 20, -13, -20, 55, 107, 200, -100, -222]
numbers_first=numbers[-1]
print(numbers_first)

numbers_second=numbers[2:7]
print(numbers_second)

numbers_third=numbers[0:7:3]
print(numbers_third)

numbers_fourth=numbers[-5:]
numbers_fourth.reverse()
print(numbers_fourth)

numbers_fifth=[x for x in numbers if x > 0]
print(numbers_fifth)

numbers_sixth="There are "+str(len(numbers))+" numbers"
print(numbers_sixth)


# 15.
pairs = ((2010, 'cm'), (1234, 'm'), (129.59, 'km'), (41231, 'm'), (67, 'km'))

pair_strs=[]
for pair in pairs:
    number=pair[0]
    unit=pair[1]
    newvalue=number
    if unit=='cm':
        newvalue=newvalue*0.01*0.001
        pair_strs.append((newvalue,'kilometers'))
    elif unit=='m':
        newvalue=newvalue*0.001
        pair_strs.append((newvalue,'kilometers'))
    elif unit=='km':
        pair_strs.append((newvalue,'kilometers'))



for i in range(len(pairs)):
    pair=pairs[i]
    pair_conv=pair_strs[i]
    if pair[0]==pair_conv[0]:
        print(f'{str(pair[0]):>8s} {pair[1]:2s}   -> {pair_conv[0]:>8.2f} {pair_conv[1]}.')
    else:
        print(f'{str(pair[0]):>8s} {pair[1]:2s}   -> {pair_conv[0]:>8.2f} {pair_conv[1]} (converted).')



# 16.
names = ["Jim Lee", "Sir Ali Baba", "Kathy", "Bob Tim"]
i=1
for name in names:
    name_list=name.split(' ')
    name_len=len(name_list)
    print(f'{i}. {name} - {name_len} word(s)')
    i+=1

# 17.
values = [('Bob', 4), ('Jo', 5), ('Harry', 3), ('Al', 3), ('Gwen', 3)]

new_values=[]
for value in values:
    new_values.append(str(value[1])+'-'+value[0])
new_values.sort()

print(new_values)

# 18.
# Explanation:
# in the init_this() function, init things not change the outside variables, because the value of internal 'things'
# not equal to external 'things' of function.
def init_this(things):
    """Initialize empty list"""
    things = [1, 2, 3]
    return things

some_things = []
some_things=init_this(some_things)
print(some_things)


# 19.
values = [4, 2, -3, 12, 8, 2, 9, -3]

def get_unique_powers(values):
    unique_powers=[]
    for value in values:
        if value*value not in unique_powers:
            unique_powers.append(value*value)
    unique_powers.sort()
    return unique_powers

def get_products(values):
    products=[]
    i=0
    for value in values:
        products.append(i*value)
        i+=1
    return products

def get_avg_number(values):
    i=1
    sum=0
    for value in values:
        sum+=value
        i+=1
    return sum/i
def get_bigger_numbers(values):
    bigger_numbers=[]
    avg_number=get_avg_number(values)
    for value in values:
        if value>avg_number:
            bigger_numbers.append(value)
    return bigger_numbers

print(get_unique_powers(values))
print(get_products(values))
print(get_bigger_numbers(values))


# 20. Answer in musicians.py
# 21. Answer in thing.py
# 22. Answer in stamps.py
