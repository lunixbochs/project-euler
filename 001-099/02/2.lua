a = 0
b = 1
total = 0
while b < 4000000 do
    if b % 2 == 0 then
        total = total + b
    end
    a, b = b, b + a
end
print(total)
