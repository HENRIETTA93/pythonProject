'''
Given a string s, find the length of the longest substring without repeating characters.



Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
Example 4:

Input: s = ""
Output: 0


Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.

'''


class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        sublist=[]
        count=0
        longest=0
        i=0
        while i<len(s):
            if s[i] not in sublist:
                sublist.append(s[i])
                count+=1
                i+=1
            else:
                sublist.pop(0)
                longest=max(count,longest)
                count -= 1
        return max(count,longest)


    # sliding window
    def lengthOfLongestSubstring1(self, s: str) -> int:
        temp = ""
        maxv = 0
        for i in s:
            index = temp.find(i)
            if index > -1:
                maxv = max(maxv, len(temp))
                temp += i
                temp = temp[index + 1:]
            else:
                temp += i
            maxv = max(maxv, len(temp))
        return maxv



# test case ###
print(Solution().lengthOfLongestSubstring('abcabcbb'))
print(Solution().lengthOfLongestSubstring('bbbbb'))
print(Solution().lengthOfLongestSubstring('pwwkew'))
print(Solution().lengthOfLongestSubstring('aab'))

print('-------------------------------------------')
# test case ###
print(Solution().lengthOfLongestSubstring1('abcabcbb'))
print(Solution().lengthOfLongestSubstring1('bbbbb'))
print(Solution().lengthOfLongestSubstring1('pwwkew'))
print(Solution().lengthOfLongestSubstring1('aab'))

print('abc'.find('d'))