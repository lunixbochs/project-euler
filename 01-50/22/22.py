with open('input') as f:
    lines = f.read().split(',')

lines.sort()

total = 0
for i, name in enumerate(lines):
    name = name.strip('"')
    alpha = [ord(c) - ord('a') + 1 for c in name.lower()]
    total += sum(alpha) * (i + 1)

print total
