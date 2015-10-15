def check(n):
    digits = str(n)
    if len(digits) == 1:
        return False
    total = 0
    for d in digits:
        total += int(d) ** 5
    return n == total

i = 0
total = 0
while True:
    i += 1
    if check(i):
        total += i
        print total, i
