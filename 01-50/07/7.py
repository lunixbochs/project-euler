def sieve(limit):
    bits = [0] * (limit + 1)
    for i in xrange(2, limit):
        if bits[i] == -1:
            continue
        yield i
        for j in xrange(i, limit, i):
            bits[j] = -1

i = 0
for n in sieve(500000):
    i += 1
    if i == 10001:
        print n
        break
else:
    print 'no answer'
