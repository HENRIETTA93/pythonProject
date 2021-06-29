#
import sys
text=sys.stdin.read()
words=text.split()
wordcount=len(words)
print("Wordcont:",wordcount)


# type somefile.txt |python _s_1_wordCount.py