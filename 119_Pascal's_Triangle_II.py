class Solution(object):
    def getRow(self, rowIndex):
        """
        :type rowIndex: int
        :rtype: List[int]
        """
        triangle = []
        
        for num_row in range(rowIndex+1):
            row = [None for _ in range(num_row+1)]
            row[0] , row[-1] = 1 ,1
            
            for i in range(1,len(row)-1):
                row[i] = triangle[num_row-1][i-1]+triangle[num_row-1][i]
                
            triangle.append(row)
            
        return triangle[rowIndex]
    
