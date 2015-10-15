values = (1, 2, 5, 10, 20, 50, 100, 200)
solutions = set()

def solve(values, cur=0, stack=()):
    v, values = values[0], values[1:]
    total = 200 / v

    for i in xrange(total + 1):
        if v == 1:
            print i
        c = i * v
        if values:
            for n in solve(values, c + cur, stack + ((i, v),)):
                yield n
        else:
            yield stack + ((i, v),)

        if cur + c > 200:
            return

def add(stack):
    return sum([i * v for i, v in stack])

total = 0
for stack in solve(values):
    n = add(stack)
    if n == 200:
        print stack, n
        if stack in solutions:
            print 'duplicate'
            continue
        solutions.add(stack)
        total += 1

print total
