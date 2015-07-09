set a to 0
set b to 1
set total to 0
repeat while b is less than 4000000
    if (b mod 2 equals 0) then
        set total to total + b
    end
    set tmp to a
    set a to b
    set b to b + tmp
end repeat
total
