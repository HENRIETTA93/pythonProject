'''
Valid Parentheses

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.


Example 1:

Input: s = "()"
Output: true
Example 2:

Input: s = "()[]{}"
Output: true
Example 3:

Input: s = "(]"
Output: false
Example 4:

Input: s = "([)]"
Output: false
Example 5:

Input: s = "{[]}"
Output: true


Constraints:

1 <= s.length <= 104
s consists of parentheses only '()[]{}'.


'''
class Solution:
    def isValid(self, s: str) -> bool:
        lst=list(s)

        stack=[]
        while len(lst)>=0:
            if len(stack)>0:
                right=stack.pop()
                if right+lst[0]=='()' or right+lst[0]=='[]' or right+lst[0]=='{}':
                    pass
                else:
                    stack.append(right)
                    stack.append(lst[0])
            else:
                stack.append(lst[0])
            if len(lst)>1:
                lst=lst[1:]
            else:
                break

        if len(stack)==0:
            return True
        else:
            return False

    def isValid1(self, s: str) -> bool:

        stack=[]
        i=0
        while i<len(s):
            if s[i]=='(' or s[i]=='[' or s[i]=='{':
                stack.append(s[i])
            else:
                if len(stack)==0:
                    return False
                else:
                    if s[i]==')' and stack.pop()!='(':
                        return False
                    if s[i]==']' and stack.pop()!='[':
                        return False
                    if s[i]=='}' and stack.pop()!='{':
                        return False
            i+=1
        if len(stack)==0:
            return True
        else:
            return False



print(Solution().isValid('()'))
print(Solution().isValid('()[]{}'))
print(Solution().isValid('(]'))
print(Solution().isValid('([)]'))
print(Solution().isValid('{[]}'))


print(Solution().isValid1('()'))
print(Solution().isValid1('()[]{}'))
print(Solution().isValid1('(]'))
print(Solution().isValid1('([)]'))
print(Solution().isValid1('{[]}'))

