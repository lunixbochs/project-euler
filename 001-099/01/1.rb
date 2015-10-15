sum = 0
for i in 1..999 do
    if i % 5 == 0 or i % 3 == 0 then
        sum += i
    end
end
puts sum
