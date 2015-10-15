ref = set('123456789')

def pans(n):
    r = str(n)
    i = 1
    while True:
        i += 1
        r += str(i * n)
        if len(r) > 9:
            break
        if len(r) == 9 and set(r) == ref:
            yield i, r

m = 0
for i in xrange(2, 1000000000):
    for z, n in pans(i):
        if n > m:
            m = n
            print z, i, n
