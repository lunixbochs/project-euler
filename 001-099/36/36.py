import sys
import string
digs = string.digits

def int2base(x, base):
  if x < 0: sign = -1
  elif x==0: return '0'
  else: sign = 1
  x *= sign
  digits = []
  while x:
    digits.append(digs[x % base])
    x /= base
  if sign < 0:
    digits.append('-')
  digits.reverse()
  return ''.join(digits)

def base2int(n, base):
    total = 0
    for i, c in enumerate(reversed(n)):
        x = digs.index(c)
        total += (base ** i) * x
    return total

def ispalindrome(n):
    s = str(n)
    return all(s[i] == s[-i - 1] for i in xrange(len(s) / 2 + 1))

def dualdrome(n):
    return ispalindrome(n) and ispalindrome(int2base(n, 2))

print sum(i for i in xrange(1000000) if dualdrome(i))
