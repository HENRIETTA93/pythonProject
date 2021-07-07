'''
Integer to Roman
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
Given an integer, convert it to a roman numeral.



Example 1:

Input: num = 3
Output: "III"
Example 2:

Input: num = 4
Output: "IV"
Example 3:

Input: num = 9
Output: "IX"
Example 4:

Input: num = 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.
Example 5:

Input: num = 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.


Constraints:

1 <= num <= 3999
'''


class Solution:
    def intToRoman(self, num: int) -> str:
        if num<1 or num>3999: pass
        dic={1:'I',
             2:'II',
             3:'III',
             4:'IV',
             5:'V',
             6:'VI',
             7:'VII',
             8:'VIII',
             9:'IX',
             10:'X',
             20:'XX',
             30:'XXX',
             40:'XL',
             50:'L',
             60:'LX',
             70:'LXX',
             80:'LXXX',
             90:'XC',
             100:'C',
             200:'CC',
             300:'CCC',
             400:'CD',
             500:'D',
             600:'DC',
             700:'DCC',
             800:'DCCC',
             900:'CM',
             1000:'M',
             2000:'MM',
             3000:'MMM'}
        if dic.get(num):
            return dic.get(num)
        else:
            roman=''
            num_lst=list(str(num))
            for s in enumerate(num_lst):
                if int(s[1])!=0:
                    roman += dic.get(int(s[1]) * pow(10, len(num_lst) - 1 - s[0]))

            return roman




print(Solution().intToRoman(3999))

print(Solution().intToRoman(3))

print(Solution().intToRoman(4))

print(Solution().intToRoman(9))

print(Solution().intToRoman(58))

print(Solution().intToRoman(1994))

print(Solution().intToRoman(101))

print(Solution().intToRoman(1001))



