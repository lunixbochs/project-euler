sundays = 0
dow = 1

names = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']

def month_days(year, month):
    if month == 2:
        if year % 400 == 0 or (year % 100 and year % 4 == 0):
            return 29
        else:
            return 28
    elif month in (1, 3, 5, 7, 8, 10, 12):
        return 31
    else:
        return 30

for y in xrange(1900, 2001):
    for m in xrange(1, 13):
        if y >= 1901 and dow == 0:
            sundays += 1
        dow = (dow + month_days(y, m)) % 7

print sundays
