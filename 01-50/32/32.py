def factors(n):
    right = n
    for i in xrange(1, n / 2 + 1):
        if i > right:
            break
        if n % i == 0:
            x = n / i
            right = min(x, right)
            yield i, x

def pandigital(a, b, c):
    a, b, c = str(a), str(b), str(c)
    if len(a) + len(b) + len(c) == 9:
        if ''.join(sorted(set(a + b + c))) == '123456789':
            return True

    return False

total = 0
answers = set()
for c in xrange(100000):
    for a, b in factors(c):
        if pandigital(a, b, c):
            if (a, b, c) in answers:
                continue

            answers.add((a, b, c))
            total += c
            break

print total
