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

def sieve(limit):
    bits = [0] * (limit + 1)
    for i in xrange(limit):
        if bits[i] == -1:
            continue
        if isprime(i):
            yield i
            bits[i] = 1
            for j in xrange(i, limit, i):
                bits[j] = -1
        else:
            bits[i] = -1

def truncate(n):
    s = str(n)
    for i in xrange(len(s)):
        if i:
            yield int(s[:i])
        yield int(s[i:])

def truncatable(limit):
    for n in sieve(limit):
        if all(isprime(s) for s in truncate(n)):
            yield n

answers = []
for n in truncatable(1000000):
    if n > 7:
        answers.append(n)
        print len(answers), n

    if len(answers) == 11:
        break

print sum(answers)
