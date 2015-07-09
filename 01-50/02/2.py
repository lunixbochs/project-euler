def fib():
    a, b = 0, 1
    while True:
        yield b
        a, b = b, a + b

total = 0
i = 0
for i in fib():
    if i >= 4000000:
        break
    if i % 2 == 0:
        total += i

print total
