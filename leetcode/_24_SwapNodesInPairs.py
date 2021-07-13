'''
Swap Nodes in Pairs
Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)



Example 1:


Input: head = [1,2,3,4]
Output: [2,1,4,3]
Example 2:

Input: head = []
Output: []
Example 3:

Input: head = [1]
Output: [1]


Constraints:

The number of nodes in the list is in the range [0, 100].
0 <= Node.val <= 100

'''


# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def swapPairs(self, head: ListNode) -> ListNode:
        if head == None or head.next == None:
            return head
        tmp = head
        pointer = tmp.next

        tmpresult = ListNode(pointer.val, None)
        result = tmpresult
        while pointer and tmp:
            tmpresult.next = ListNode(tmp.val, None)
            tmpresult = tmpresult.next
            tmp = pointer.next
            if tmp==None:
                pass
            else:
                pointer = tmp.next
            if pointer and tmp:
                tmpresult.next=ListNode(pointer.val,None)
                tmpresult=tmpresult.next
            elif tmp:
                tmpresult.next=ListNode(tmp.val,None)
                tmpresult=tmpresult.next


        return result

    # 原来java思路
    def swapPairs(self, head: ListNode) -> ListNode:
        result=ListNode()
        result.next=head
        current=result
        while current.next!=None and current.next.next!=None:
            first=current.next
            second=current.next.next
            first.next=second.next
            current.next=second
            current.next.next=first
            current=current.next.next
        return result.next

L = ListNode(4)
L = ListNode(3, L)
L = ListNode(2, L)
L = ListNode(1, L)

Lr = Solution().swapPairs(L)
lstr = []
while Lr:
    lstr.append(Lr.val)
    Lr = Lr.next
print(lstr)

L=ListNode(5,L)
Lr = Solution().swapPairs(L)
lstr = []
while Lr:
    lstr.append(Lr.val)
    Lr = Lr.next
print(lstr)


L = None
Lr = Solution().swapPairs(L)
lstr = []
while Lr:
    lstr.append(Lr.val)
    Lr = Lr.next
print(lstr)


L=ListNode(1,None)
Lr = Solution().swapPairs(L)
lstr = []
while Lr:
    lstr.append(Lr.val)
    Lr = Lr.next
print(lstr)
