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
def fact(n):
    if n == 0:
        return 1

    acc = n
    for i in xrange(n - 1, 1, -1):
        acc *= i
    return acc

@memoize
def sfact(n):
    total = 0
    for c in str(n):
        i = int(c)
        total += fact(i)
        if total > n:
            return 0
    return total

f9 = fact(9)

total = 0
i = 2
while True:
    i += 1
    s = sfact(i)
    if s == i:
        total += i
        print total, i
    else:
        if i - s > f9:
            i = i - (i % 10) + 10

    if s > 0:
        print total, i, sfact(i)
