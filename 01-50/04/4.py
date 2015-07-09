def ispalindrome(s):
    return s == ''.join(list(reversed(s)))

largest = 0
for a in xrange(100, 1000):
    for b in xrange(100, 1000):
        if ispalindrome(str(a * b)):
            largest = max(a * b, largest)

print largest
