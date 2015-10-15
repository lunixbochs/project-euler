with open('input', 'r') as f:
    nums = f.read().strip().split('\n')

n = sum(int(i) for i in nums)
print str(n)[:10]
