class Solution(object):
    def findUnsortedSubarray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        sameOrder = [a == b for (a, b) in zip(nums, sorted(nums))]
        
        return 0 if all(sameOrder) else len(nums) - sameOrder.index(False) - sameOrder[::-1].index(False)
