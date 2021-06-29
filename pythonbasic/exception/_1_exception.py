# raise Exception


# 自定义异常类
class SomeCustomException(Exception): pass

# raise SomeCustomException
#####################################################
'''
ZeroDivisionError: division by zero
'''
x=int(input('Enter the first number: '))
y=int(input('Enter the second number: '))

print(x/y)

try:
    x = int(input('Enter the first number: '))
    y = int(input('Enter the second number: '))
    print(x /y)
except ZeroDivisionError:
    print("The second number can't be zero!")

#####################################################

class MuffledCalculator(str):
    muffled=str
    def calc(self, expr):
        try:
            return eval(expr)
        except ZeroDivisionError:
            if self.muffled:
                print('Division by zero is illegal')
            else:
                raise

muffled=MuffledCalculator(True)
# muffled.muffled=True
result=muffled.calc("10/0")
print(result)