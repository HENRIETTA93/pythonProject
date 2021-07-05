'''
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).


Example 1:

Input: x = 123
Output: 321
Example 2:

Input: x = -123
Output: -321
Example 3:

Input: x = 120
Output: 21
Example 4:

Input: x = 0
Output: 0


Constraints:

-231 <= x <= 231 - 1
'''


class Solution:
    def reverse(self, x: int) -> int:
        xlist = []
        xx = x
        if xx < 0:
            xx = 0 - xx
        while xx > 0:
            xlist.append(xx % 10)
            xx = int(xx / 10)
        if x < 0:
            count = 0
            while count < len(xlist):
                xlist[count] = 0 - xlist[count]
                count += 1


        i=0
        while i<len(xlist):
            if xlist[i]==0:
                xlist.remove(xlist[i])
            else:
                break


        result=0
        p=0
        xlist.reverse()
        for i in xlist:
            if i != 0:
                result += i * pow(10, p)
                p += 1
            else:
                p += 1

        if result>pow(2,31)-1 or result<0-pow(2,31): result=0


        return result


print(Solution().reverse(123))
print(Solution().reverse(-123))
print(Solution().reverse(120))
print(Solution().reverse(0))
print(Solution().reverse(901000))
print(Solution().reverse(102))

print(Solution().reverse(1534236469))

print(Solution().reverse(-65090))


print(Solution().reverse(-2147483648))
