nums = ''.join(str(i) for i in xrange(1, 1000000 + 1))
d = lambda i: int(nums[i - 1])
print d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)
