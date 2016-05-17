# unused: growable prime sieve

class Sieve:
    def __init__(self):
        self.bits = [0] * 16
        self.primes = []
        self.pos = 2
        self.offset = 0

    def expand(self):
        length = len(self.bits) + self.offset
        newlen = length * 2
        self.bits = (newlen) * [0]
        self.offset += length

        for p in self.primes:
            i = min(length / p * p, p * 2)
            while i < newlen:
                self.bits[i - self.offset] = -1
                i += p

    def __iter__(self):
        while True:
            i = self.pos
            self.pos += 1
            if i >= len(self.bits):
                self.expand()

            if self.bits[i - self.offset] == -1:
                continue
            if self.bits[i - self.offset] == 0:
                yield i
                self.primes.append(i)
                self.bits[i - self.offset] = 1
                for j in xrange(i, len(self.bits), i):
                    self.bits[j - self.offset] = -1

def sieve(limit):
    bits = [0] * (limit + 1)
    for i in xrange(2, limit):
        if bits[i] == 0:
            yield i
            bits[i] = 1
            for j in xrange(i, limit, i):
                bits[j] = -1

def pandigital(n):
    return map(int, sorted(list(str(p)))) == range(1, len(str(p)) + 1)

# search space is constrained to 7 digits here. it's a fair bit slower with 9 digits.
for p in sieve(10000000):
    if pandigital(p):
        print p
