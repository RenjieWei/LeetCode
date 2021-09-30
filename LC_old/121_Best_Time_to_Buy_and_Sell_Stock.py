class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        curPro = maxPro = 0
        for i in range(1,len(prices)):
            curPro = max(0,curPro + prices[i] - prices[i-1])
            maxPro = max(curPro,maxPro)
        return maxPro
        
