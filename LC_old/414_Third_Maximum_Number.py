class Solution(object):
    def thirdMax(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        max1 = max2 = max3 = None
        for num in nums:
            if num > max1:
                max2, max3 = max1, max2
                max1 = num
            elif num > max2 and num < max1:
                max2, max3 = num, max2
            elif num > max3 and num < max2:
                max3 = num
        return max1 if max3 == None else max3
                
