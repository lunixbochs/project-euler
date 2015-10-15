set sum to 0
set i to 1
repeat while i is less than 1000
    if (i mod 5 equals 0) or (i mod 3 equals 0) then
        set sum to sum + i
    end
    set i to i + 1
end repeat
sum
