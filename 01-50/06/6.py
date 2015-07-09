nums = range(1, 101)

square_sum = sum(n ** 2 for n in nums)
sum_square = sum(nums) ** 2
print sum_square - square_sum
