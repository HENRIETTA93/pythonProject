'''
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string s, int numRows);


Example 1:

Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
Example 2:

Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I
Example 3:

Input: s = "A", numRows = 1
Output: "A"


Constraints:

1 <= s.length <= 1000
s consists of English letters (lower-case and upper-case), ',' and '.'.
1 <= numRows <= 1000

'''


class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if numRows==1: return s
        result = []
        rows = []
        for i in range(numRows):
            row = []
            rows.append(row)

        count = 0
        index = 0
        zig = True
        while count < len(s):
            if index >= 0 and index < numRows and zig == True:
                rows[index].append(s[count])
                count += 1
                index += 1
            elif index >= numRows or zig == False:
                if index >= numRows:
                    index -= 2
                    zig = False
                rows[index].append(s[count])
                count += 1
                if index==0:
                    index+=1
                else:
                    index -= 1
                if index <= 0:
                    index=0
                    zig = True

        for row in rows:
            for item in row:
                result.append(item)
        return ''.join(result)


print(Solution().convert('PAYPALISHIRING', 3))
print(Solution().convert('PAYPALISHIRING', 4))
print(Solution().convert('PAYPALISHIRING', 1))
print(Solution().convert('A', 1))
print(Solution().convert("ABCDEF",2))
