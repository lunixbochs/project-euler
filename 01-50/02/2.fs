variable sum
variable a
variable b
: run
    0 sum !
    0 a !
    1 b !
    begin
        b @ a @ b @ + b ! a !
        b @ 4000000 <
    while
        b @ 2 mod 0 = if b @ sum @ + sum ! then
    repeat
    sum @ . CR ;
run
bye
