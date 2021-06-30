print("The middle of the text".center(30))

print("With a moo-moo here, and a moo-moo there".find("moo"))
print("With a moo-moo here, and a moo-moo there".find("mad"))

# seq=[1,2,3,4,5]
# sep='+'
# TypeError: sequence item 0: expected str instance, int found
# sep.join(seq)

seq=['1','2','3','4','5']
sep='+'
ss=sep.join(seq)
print(ss)