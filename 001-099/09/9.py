for a in xrange(1, 1000):
    for b in xrange(1, 1000):
        c = (a ** 2 + b ** 2) ** .5
        if a + b + c == 1000:
            print int(a * b * c)
            exit(0)
        elif a + b + c > 1000:
            break
