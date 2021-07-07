'''
Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".



Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.


Constraints:

1 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] consists of only lower-case English letters.

'''


class Solution:
    def longestCommonPrefix(self, strs: [str]) -> str:
        if len(strs) > 200 or len(strs) < 1: pass
        first = ""
        count = 0
        len_str = len(strs[0])
        newstrs=[]
        while count < len_str:
            if len(strs[0]) > 0: first += strs[0][0]
            for str in strs:
                if len(str)==0 or str[0] != first[count]:
                    first = first[:-1]
                    return first
                else:
                    nstr = str[1:]
                    newstrs.append(nstr)
            strs=newstrs
            newstrs=[]
            count += 1

        return first
        pass


print(Solution().longestCommonPrefix(["flower", "flow", "flight"]))
print(Solution().longestCommonPrefix(["dog", "racecar", "car"]))

print(Solution().longestCommonPrefix(["flower", "flower", "flower", "flower"]))

print(Solution().longestCommonPrefix(["flower", ""]))
print(Solution().longestCommonPrefix(["aa", "a"]))

print(Solution().longestCommonPrefix(["ab", "a"]))

print(Solution().longestCommonPrefix(["a", "aa"]))

print(Solution().longestCommonPrefix(["a", "ab"]))

