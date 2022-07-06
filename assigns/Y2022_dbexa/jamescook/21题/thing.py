"""Thing class"""


class Thing:

    def __init__(self, name, age=0):
        self.name = name
        self.age = age

    def process(self, i):
        pass

    def __str__(self):
        return "I'm " + self.name + " (" + str(self.age) + ")."
