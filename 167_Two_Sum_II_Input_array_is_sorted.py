class Solution(object):
    def twoSum(self, numbers, target):
        """
        :type numbers: List[int]
        :type target: int
        :rtype: List[int]
        """
        mydict = {}
        for index, nums in enumerate(numbers):
            if nums in mydict:
                return [mydict[nums]+1,index+1]
            mydict[target-nums] = index
