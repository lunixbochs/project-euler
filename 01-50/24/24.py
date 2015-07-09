import itertools

perm = itertools.permutations(range(10))
start = list(itertools.islice(perm, 1000000))
start.sort()
print ''.join(str(s) for s in start[-1])
