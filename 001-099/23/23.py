abundant = set()
sums = set()
total = 0

def factors(n):
    for i in xrange(1, n / 2 + 1):
        if n % i == 0:
            yield i

print 'phase 1'
for i in xrange(1, 28124):
    if sum(factors(i)) > i:
        abundant.add(i)

print 'phase 2'
for a in abundant:
    for b in abundant:
        sums.add(a + b)

print 'phase 3'
for i in xrange(1, 28124):
    if not i in sums:
        print i
        total += i

print
print total
