'''
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.



Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]


Constraints:

2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.


Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
'''


class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """

        '''
        using list 
        '''
        rlist = []
        for i, num in enumerate(nums):
            if target - num in nums and nums.index(target - num) != i:
                rlist.append(i)
                rlist.append(nums.index(target - num))
            else:
                pass
        rlist=list(set(rlist))
        return rlist


    '''
    using dic
    '''
    def twoSum1(self,nums,target):
        dic={}
        for i, num in enumerate(nums):
            if target-num in dic:
                return [dic[target-num],i]
            dic[num]=i


print(Solution().twoSum([2, 7, 11, 15], 9))

print(Solution().twoSum([3, 2, 4], 6))

print(Solution().twoSum([3, 3], 6))

print("----------------------------")
print(Solution().twoSum1([2, 7, 11, 15], 9))

print(Solution().twoSum1([3, 2, 4], 6))

print(Solution().twoSum1([3, 3], 6))
