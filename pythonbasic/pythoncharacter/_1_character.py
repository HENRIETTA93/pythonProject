## 构造函数 ##

class FooBar:
    def __init__(self):
        self.somevar=30

f=FooBar()
print(f.somevar)
print("----------------------------")
# 重写普通方法和特殊的构造函数
class A:
    def hello(self):
        print("Hello, I'm A")

class B(A):
    pass

a=A()
b=B()
a.hello()
b.hello()

class B(A):
    def hello(self):
        print("Hello, I'm B")
a = A()
b = B()
a.hello()
b.hello()

print("--------------------------")
class Bird:
    def __init__(self):
        self.hungry=True
    def eat(self):
        if self.hungry:
            print("Aaaah ...")
            self.hungry=False
        else:
            print("No, thanks!")

b=Bird()
b.eat()
b.eat()

class SongBird(Bird):
    def __init__(self):
        self.sound='Squawk!'

    def sing(self):
        print(self.sound)

sb=SongBird()
sb.sing()
# 调用未关联的超类构造函数，使用函数super
#sb.eat() #AttributeError: 'SongBird' object has no attribute 'hungry'

class SongBird(Bird):
    def  __init__(self):
        Bird.__init__(self)
        self.sound='Squawk!'
    def sing(self):
        print(self.sound)

sb=SongBird()
sb.sing()
sb.eat()
sb.eat()

class SwimBird(Bird):
    def __init__(self):
        super().__init__()
        self.swim='Wua...'
    def swimming(self):
        print(self.swim)
sb=SwimBird()
sb.swimming()
sb.eat()
sb.eat()

print('------------------------------------')

## 迭代器

class Fibs:
    def __init__(self):
        self.a=0
        self.b=1

    def __next__(self):
        self.a, self.b=self.b, self.a+self.b
        return self.a
    def __iter__(self):
        return self

fibs=Fibs()

for f in fibs:
    if f>1000:
        print(f)
        break
it=iter([1,2,3])
print(next(it))
print(next(it))

# 从迭代器创建序列
class TestIterator:
    value=0
    def __next__(self):
        self.value+=1
        if self.value>10: raise StopIteration
        return self.value

    def __iter__(self):
        return self

ti=TestIterator()
print(list(ti))

print('----------------------------------')

## 生成器
nested=[[1,2],[3,4],[5]]

def flatten(nested):
    for sublist in nested:
        for element in sublist:
            yield element

for num in flatten(nested):
    print(num)


def flatten(nested):
    try:
        try:
            nested+''
        except TypeError: pass
        else:
            raise TypeError
        for sublist in nested:
            for element in sublist:
                yield element
    except TypeError:
        yield nested

print(list(flatten(['foo',['bar',['bar']]])))