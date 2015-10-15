import sys

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

@memoize
def isprime(n):
    return factors(n) == (1, n)

def prime_factors(n):
    for f in factors(n):
        if isprime(f):
            yield f

for f in prime_factors(600851475143):
    print f
