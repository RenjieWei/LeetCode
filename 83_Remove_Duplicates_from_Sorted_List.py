# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

# Two Pointers
class Solution(object):
    def deleteDuplicates(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # Edge Case
        if not head:
            return head
        
        p = head
        q = head.next
        
        while q:
            if p.val == q.val:
                p.next = q.next
                q = q.next
            else:
                p = p.next
                q = q.next
            
        return head
        
# One Pointer
class Solution(object):
    def deleteDuplicates(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        cur = head
        while cur:
            while cur.next and cur.next.val == cur.val:
                cur.next = cur.next.next
            
            cur = cur.next
        return head
