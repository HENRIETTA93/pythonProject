import sys

roman = [
    ('M', 1000),
    ('CM', 900),
    ('D', 500),
    ('CD', 400),
    ('C', 100),
    ('XC', 90),
    ('L', 50),
    ('XL', 40),
    ('X', 10),
    ('IX', 9),
    ('V', 5),
    ('IV', 4),
    ('I', 1)
]

numeral = sys.argv[1]

value = 0
i = 0
while i < len(numeral):
    for x, v in roman:
        if i+len(x) <= len(numeral) and x == numeral[i:i+len(x)]:
            value += v
            i += len(x)
            break
            
print(value)
