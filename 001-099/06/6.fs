: sum_square { a b -- }
    0 a b do i + loop dup * ;

: square_sum { a b -- }
    0 a b do i i * + loop ;

: run
    101 1 sum_square
    101 1 square_sum - . CR ;

run
bye
