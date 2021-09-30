class Solution(object):
    def containsNearbyDuplicate(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: bool
        """
        mydict = dict()
        
        for index, num in enumerate(nums):
            if num in mydict and index - mydict[num] <= k:
                return True
            mydict[num] = index
            
        return False
        
