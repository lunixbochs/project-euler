def factors(n):
    out = []
    for i in xrange(1, n - 1):
        if n % i == 0:
            out.append(i)
    return out

lookup = {}

for i in xrange(1, 10000):
    f = factors(i)
    lookup[i] = sum(f)

amicable = set()
for i in xrange(1, 10000):
    f = lookup[i]
    if 0 < f < 10000 and lookup[f] == i:
        if i != f:
            amicable.add(i)
            amicable.add(f)

print sum(amicable)
