# Method 1
class Solution(object):
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        import collections
        count = collections.Counter(nums)
        
        return(max(count,key=count.get))
        
        
 # Method 2
 class Solution(object):
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        mydict = {}
        for index, num in enumerate(nums):
            if num in mydict:
                mydict[num] += 1
            else:
                mydict[num] = 1
        return max(mydict, key=mydict.get)
        
