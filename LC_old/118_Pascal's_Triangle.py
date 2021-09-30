class Solution(object):
    def generate(self, numRows):
        """
        :type numRows: int
        :rtype: List[List[int]]
        """
        triangle = []
        
        for r_num in range(numRows):
            row = [None for _ in range(r_num+1)]
            row[0], row[-1] = 1,1

            for i in range(1,len(row)-1):
                row[i] = triangle[r_num-1][i-1] + triangle[r_num-1][i]
            
            
            triangle.append(row)
            
        return triangle
