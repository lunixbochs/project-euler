from fractions import Fraction

def cancel(a, b):
    A, B = str(a), str(b)
    c = set(A).intersection(set(B))
    if c:
        c = c.pop()
        if c in A and c in B:
            a1 = int(A.replace(c, '', 1))
            b1 = int(B.replace(c, '', 1))
            if a1 == a / 10. or b1 == b / 10.:
                return ()

            if 0 in (a1, b1):
                return ()

            if Fraction(a1, b1) == Fraction(a, b):
                return ((a1, b1),)
    return ()

answers = set()
for a in xrange(10, 100):
    for b in xrange(10, 100):
        if a >= b:
            continue

        for a1, b1 in cancel(a, b):
            answers.add((a1, b1))

answer = reduce(lambda c, ab: Fraction(ab[0], ab[1]) * c, answers, Fraction(1, 1))
print answer
