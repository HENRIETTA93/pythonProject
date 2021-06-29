### 类 ####

class Person:
    def set_name(self,name):
        self.name=name

    def get_name(self):
        return self.name

    def greet(self):
        print("Hello, world! I'm {}.".format(self.name))

foo=Person()
bar=Person()
foo.set_name('Luke Skywalker')
bar.set_name('Anakin Skkywalker')

foo.greet()
greet=bar.greet()

print(foo.name)
bar.name='Yoda'
bar.greet()


class Secretive:
    def __inaccessible(self):
        print("Bet you can't see me ...")
    def accessible(self):
        print("The secret message is:")
        self.__inaccessible()

s=Secretive()
# s.__inaccessible()

s.accessible()
Secretive._Secretive__inaccessible
s._Secretive__inaccessible()


## 继承 ##

class Filter:
    def init(self):
        self.blocked=[]

    def filter(self,sequence):
        return [x for x in sequence if x not in self.blocked]

f=Filter()
f.init()
print(f.filter([1,2,3]))

class SPAMFilter(Filter):
    def init(self):
        self.blocked=['SPAM']

s=SPAMFilter()
s.init()
print(s.filter(['SPAM','SPAM','eggs','bacon','SPAM']))


print(issubclass(SPAMFilter,Filter))
print(issubclass(Filter,SPAMFilter))

print(SPAMFilter.__bases__)
print(Filter.__bases__)

print(isinstance(s,SPAMFilter))
print(isinstance(s,Filter))
print(isinstance(s,str))

print(s.__class__)

## 多个超类


## 抽象基类
class Talker:
    def talk(self):
        pass