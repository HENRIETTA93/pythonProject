
str1="hello"
str2="python"
str3="world"

number1=100
number2=99.0

year=2021

name='colin morgan'
phone=121212

print(f'This year is {year:10d}')
print(f'My name is {name: <20} my phone is {phone:15d}')

# This year is       2021
# My name is colin morgan         my phone is          121212

print(f'My name is {name: >20}, my phone is {phone:15d}')
print(f'My name is {name: >20}, my phone is {phone: >15d}')
print(f'My name is {name: >20}, my phone is {phone: ^15d}')
print(f'My name is {name: >20s}, my phone is {phone: <15d}')

print('my name is {:>20s}, my phone is {:<15d}'.format(name,phone))
print('my name is {:>20s}, my phone is {:>15d}'.format(name,phone))


print('my name is', '%20s,'% name, 'my phone is', '%15d'%phone)

print('my name is', '%20s,'% name, 'my phone is', '%-15d'%phone)

print(f'{" ":8s}' + 'The whole group')
print('{:8s}{}'.format('','The whole group'))
print('%7s'%' ','The whole group')
