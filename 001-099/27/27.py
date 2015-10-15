def memoize(func):
    memo = {}
    def wrapper(*args):
        args = tuple(args)
        if args in memo:
            return memo[args]
        else:
            result = func(*args)
            memo[args] = result
            return result
    wrapper.__name__ = func.__name__
    return wrapper

@memoize
def isprime(n):
    n = abs(n)
    for i in xrange(2, n / 2 + 1):
        if n % i == 0:
            return False
    return True

@memoize
def n2(n):
    return n ** 2

def quadratic(a, b):
    n = 0
    while True:
        x = n2(n) + a * n + b
        if not isprime(x):
            return n
        n += 1

best = (0, 0, 0)
for a in xrange(-1000, 1000):
    for b in xrange(-1000, 1000):
        count = quadratic(a, b)
        if count > best[0]:
            best = (count, a, b)
            print best

print best[1] * best[2]
