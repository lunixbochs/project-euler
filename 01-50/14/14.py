def length1(start):
    length = 1
    n = start
    while n > 1:
        length += 1
        if n % 2 == 0:
            n = n / 2
        else:
            n = 3 * n + 1
    return length


def length2(start):
    length = 1
    n = start
    while n > 1:
        while n & 1:
            n = (3 * n + 1) / 2
            length += 2
        while not n & 1:
            n /= 2
            length += 1
    return length


best_len = 0
for i in xrange(0, 1000000):
    print i
    length = length1(i)
    if length > best_len:
        best = i
        best_len = length

print best, best_len
