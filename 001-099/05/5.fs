: gcd { a b -- }
    1
    a 1 = if exit then
    a 1 do
        a i mod 0 = 
        b i mod 0 =
        and if drop i then
    loop ;

: lcm { a b -- }
    a b * a b gcd / ;

: run
    1 20 2 do i lcm loop . CR ;

run
bye
