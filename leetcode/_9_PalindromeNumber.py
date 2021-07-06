'''
Given an integer x, return true if x is palindrome integer.

An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.



Example 1:

Input: x = 121
Output: true
Example 2:

Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
Example 3:

Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
Example 4:

Input: x = -101
Output: false


Constraints:

-231 <= x <= 231 - 1


Follow up: Could you solve it without converting the integer to a string?
'''


class Solution:
    def isPalindrome(self, x: int) -> bool:
        xstr=str(x)
        i=0
        j=len(xstr)-1
        while i<j:
            if xstr[i]!=xstr[j]:
                return False
            else:
                i+=1
                j-=1
        return True

print(Solution().isPalindrome(121))
print(Solution().isPalindrome(-121))
print(Solution().isPalindrome(-101))
print(Solution().isPalindrome(10))
print(Solution().isPalindrome(0))
print(Solution().isPalindrome(88))
