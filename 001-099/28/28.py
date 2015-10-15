def calc(run):
    if run == 1:
        yield 0, 0

    for i in xrange(run - 1):
        if i == 0:
            yield 1, 0
        else:
            yield 0, 1

    for i in xrange(run - 1):
        yield -1, 0
    
    for i in xrange(run - 1):
        yield 0, -1

    for i in xrange(run - 1):
        yield 1, 0

def spiral(w, h):
    template = [[0] * w for i in xrange(h)]
    x, y = (w / 2, h / 2)
    i = 1
    run = 1
    while True:
        for xc, yc in calc(run):
            x += xc
            y += yc
            if 0 <= x < w and 0 <= y <= h:
                template[y][x] = i
                i += 1
            else:
                break
        else:
            run += 2
            continue
        break
    return template

def cross(s, w):
    total = 0
    for x in xrange(w):
        total += s[x][x]
        if x != w / 2:
            total += s[x][w - x - 1]
    return total

s = spiral(1001, 1001)
print cross(s, 1001)
