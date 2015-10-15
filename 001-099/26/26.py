from decimal import getcontext, Decimal

x = {}

def rlen(n):
    for e in xrange(2, len(n)):
        if n[:e] == n[e:e+e]:
            return e
    return 0

def ilen(i):
    x = str(1. / i).split('.')[1]
    r = rlen(x)
    if r > 2:
        return r
    elif len(x) > 5:
        getcontext().prec = 100
        x = str(Decimal(1) / Decimal(i)).split('.')[1]
        r = rlen(x)
        if r > 2:
            return r
        else:
            getcontext().prec = 10000
            x = str(Decimal(1) / Decimal(i)).split('.')[1]
            return rlen(x)
    else:
        return 1

for i in xrange(2, 1000):
    x[ilen(i)] = i
    print i

k = sorted(x.keys())[-1]
print x[k], k
