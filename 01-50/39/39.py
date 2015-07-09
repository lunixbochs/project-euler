def solutions(n):
    for h in xrange(1, n):
        for a in xrange(1, h):
            b = (n - h - a)
            if b > 0 and a ** 2 + b ** 2 == h ** 2:
                yield a, b, h
                break

def triangles(limit):
    top = 0
    for i in xrange(limit):
        count = sum(1 for z in solutions(i))
        if count > top:
            top = i
            print i, count
            top = count

triangles(1000)
