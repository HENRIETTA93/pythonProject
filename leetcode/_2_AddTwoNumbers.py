'''
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example 1:


Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
Example 2:

Input: l1 = [0], l2 = [0]
Output: [0]
Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]


Constraints:

The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.
'''

# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        l1_list=[]
        l2_list=[]

        while(l1 is not None):
            l1_list.insert(0,l1.val)
            l1=l1.next
        while(l2 is not None):
            l2_list.insert(0,l2.val)
            l2=l2.next
        l1_list=map(lambda x: str(x), l1_list)
        l2_list=map(lambda x: str(x), l2_list)
        first=int(''.join(l1_list))
        second=int(''.join(l2_list))

        sum=int(first)+int(second)

        sum_list=list(str(sum))
        # sum_list.reverse()
        sum_list=[int(x) for x in sum_list]

        rListNode=ListNode(sum_list[0])
        for x in sum_list[1:]:
            rListNode=ListNode(x,rListNode)

        return rListNode
        # return sum_list


l11=ListNode(3)
l12=ListNode(4,l11)
l13=ListNode(2,l12)

l21=ListNode(4)
l22=ListNode(6,l21)
l23=ListNode(5,l22)
print(Solution().addTwoNumbers(l13,l23))

l1=ListNode()
l2=ListNode()
print(Solution().addTwoNumbers(l1,l2))

l11=ListNode(9)
l12=ListNode(9,l11)
l13=ListNode(9,l12)
l14=ListNode(9,l13)
l15=ListNode(9,l14)
l16=ListNode(9,l15)
l17=ListNode(9,l16)

l21=ListNode(9)
l22=ListNode(9,l11)
l23=ListNode(9,l12)
l24=ListNode(9,l13)
print(Solution().addTwoNumbers(l17,l24))