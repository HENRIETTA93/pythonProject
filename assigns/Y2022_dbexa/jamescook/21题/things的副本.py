"""
CP1404 Exam Online Assignment Question
Expected output:

0. I'm Paul (0).
0. I'm pAUL (0).
...
1. I'm Simon (0).
1. I'm sIMON (5).
...
2. I'm Art (0).
2. I'm aRT (6).
...
3. I'm Garfunkel (7).
3. I'm gARFUNKEL (34).
...
"""
from thing import Thing


def main():
    names = ["Paul", "Simon", "Art"]
    things = []
    for name in names:
        things.append(Thing(name))

    another = Thing("Garfunkel", 7)
    things.append(another)

    for i in range(len(things)):
        print("{}. {}.".format(i, things[i]))
        things[i].process(i)
        print("{}. {}.".format(i, things[i]))
        print("...")


main()
