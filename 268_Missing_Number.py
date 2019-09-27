class Solution(object):
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        nums = set(nums)
        for i in range(len(nums)+1):
            if i not in nums:
                return i
                
# we first insert each element of nums into a set, allowing us to later query for containment in \mathcal{O}(1)O(1) time.
