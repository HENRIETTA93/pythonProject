'''
Merge Two Sorted Lists

Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.



Example 1:


Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]
Example 2:

Input: l1 = [], l2 = []
Output: []
Example 3:

Input: l1 = [], l2 = [0]
Output: [0]


Constraints:

The number of nodes in both lists is in the range [0, 50].
-100 <= Node.val <= 100
Both l1 and l2 are sorted in non-decreasing order.
'''


# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> list:

        lst = []
        while l1 != None and l2!= None:
            if l1.val <= l2.val:
                lst.append(l1.val)
                l1 = l1.next
            elif l1.val >= l2.val:
                lst.append(l2.val)
                l2 = l2.next

        while l1!= None:
            lst.append(l1.val)
            l1 = l1.next

        while l2!= None:
            lst.append(l2.val)
            l2 = l2.next

        lst.reverse()


        lresult=ListNode()
        i=0
        for i in range(len(lst)):
            if i==0:
                lresult=ListNode(lst[0],None)
            else:
                lresult=ListNode(lst[i],lresult)
        if len(lst)==0:
            return
        else:
            return lresult
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> list:

        lst = []
        while l1.next != None and l2.next!= None:
            if l1.val <= l2.val:
                lst.append(l1.val)
                l1 = l1.next
            elif l1.val >= l2.val:
                lst.append(l2.val)
                l2 = l2.next

        while l1.next!= None:
            lst.append(l1.val)
            l1 = l1.next

        while l2.next!= None:
            lst.append(l2.val)
            l2 = l2.next

        lst.reverse()


        lresult=ListNode()
        i=0
        for i in range(len(lst)):
            if i==0:
                lresult=ListNode(lst[0],None)
            else:
                lresult=ListNode(lst[i],lresult)
        if len(lst)==0:
            return
        else:
            return lresult


# case 1
L1 = ListNode()
L1 = ListNode(4, L1)
L1 = ListNode(2, L1)
L1 = ListNode(1, L1)

L2 = ListNode()
L2 = ListNode(4, L2)
L2 = ListNode(3, L2)
L2 = ListNode(1, L2)


Lr1 = Solution().mergeTwoLists(L1, L2)
lst1 = []
while Lr1 != None:
    lst1.append(Lr1.val)
    Lr1 = Lr1.next

print(lst1)

# case 2
L1 = ListNode()
L2 = ListNode()

Lr1 = Solution().mergeTwoLists(L1, L2)
lst1 = []
while Lr1 != None:
    lst1.append(Lr1.val)
    Lr1 = Lr1.next

print(lst1)

# case 3

L1 = ListNode()
L2 = ListNode()
L2=ListNode(0,L2)

Lr1 = Solution().mergeTwoLists(L1, L2)
lst1 = []
while Lr1 != None:
    lst1.append(Lr1.val)
    Lr1 = Lr1.next

print(lst1)
