#hash table
#time complexity O(n); space complexity O(n)
def twoSum(nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        mydict = {}
        for index, value in enumerate(nums):
            if value in mydict:
                return [mydict[value],index]
            mydict[target-value] = index

def main():
    print(twoSum([2, 7, 11, 15], 9))
    print(twoSum([2, 7, 11, -1, 3, 15], 1))


if __name__ == "__main__":
    main()
