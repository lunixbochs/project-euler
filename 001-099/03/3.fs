: factors { n -- }
    0
    n s>f fsqrt f>s 1 do
        n i mod
        0 = if i swap 1 + then
    loop ;

: n_factors { n -- }
    n factors dup >r 0 do drop loop r> ;

: prime { n -- }
    n n_factors 2 < ;

: run
    600851475143 factors
    1 do
        dup prime if . CR leave then
        drop
    loop ;
run
bye
