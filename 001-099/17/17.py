def d1(n):
    return [None, 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'][n % 10]

def d2(n):
    if n < 20:
        return ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'][n - 10]
    else:
        first = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'][(n - 20) / 10]
        second = d1(n)
        if second:
            return ' '.join((first, second))
        else:
            return first

def d3(n):
    first = d1(n / 100)
    if n % 100:
        second = dispatch(n % 100)
        return ' '.join((first, 'hundred and', second))
    else:
        return ' '.join((first, 'hundred'))

def dispatch(n):
    if n == 1000:
        return 'one thousand'
    elif 100 <= n < 1000:
        return d3(n)
    elif 10 <= n < 100:
        return d2(n)
    elif 0 <= n < 10:
        return d1(n)

if __name__ == '__main__':
    count = 0
    for i in xrange(1, 1001):
        count += len(dispatch(i).replace(' ', ''))
    print count
