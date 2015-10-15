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
def factors(n):
    result = {1, n}
    right = n
    for i in xrange(2, n / 2 + 1):
        if right > 0 and i > right:
            break
        if n % i == 0:
            result.add(i)
            result.add(n / i)
            right = min(n / i, right)

    result.add(n)
    return tuple(sorted(result))

def gcd(a, b):
    a = set(factors(a))
    b = set(factors(b))
    return max(a.intersection(b))

def lcm(*args):
    args = list(args)
    a = args.pop(0)
    while args:
        b = args.pop(0)
        a = (a * b) / gcd(a, b)
    return a

nums = range(1, 21)
print lcm(*nums)
