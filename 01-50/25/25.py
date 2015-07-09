a = 0
b = 1
i = 1
while True:
    i += 1
    n = a + b
    a, b = b, n
    if i == 12:
        print n
    if len(str(n)) >= 1000:
        print i, n
        break
