def sieve(limit):
    bits = [0] * (limit + 1)
    for i in xrange(2, limit):
        if bits[i] == -1:
            continue
        yield i
        bits[i] = 1
        for j in xrange(i, limit, i):
            bits[j] = -1

print sum(sieve(2000000))
