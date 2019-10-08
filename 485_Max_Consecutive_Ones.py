class Solution(object):
    def findMaxConsecutiveOnes(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        contCount = 0
        maxCount = 0
        
        for num in nums:
            if num == 1:
                contCount += 1
                maxCount = max(maxCount, contCount)
            else:
                contCount = 0
        return maxCount
