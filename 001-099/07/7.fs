: n_factors { n -- }
    0
    n s>f fsqrt f>s
    dup 1 = if 2drop -1 exit then
    1 + 1
    do
        n i mod
        0 = if
            i n i / = -
            1 +
        then
    loop ;

: prime
    n_factors 2 < ;

: run
    0
    2 2 do
        i prime if
            1 +
        then
        dup 10001 = if i leave then
    loop . CR ;
run
bye
