# Method 1
class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        #hash table
        mydict = {}
        result = False
        for index, num in enumerate(nums):
            if num in mydict:
                result = True
                
            mydict[num] = 1
        return result
          
# Method 2
class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        numsSet = set(nums)
        return len(numsSet) != len(nums)

  
