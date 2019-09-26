class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        sum = 0
        for i in digits:
            sum = sum*10 + i
        
        return [int(x) for x in str(sum+1)]
        
