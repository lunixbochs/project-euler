#!/usr/bin/env swipl -qg main -s

fib(0, A, _, A).
fib(N, A, B, F) :- N1 is N - 1, Sum is A + B, fib(N1, B, Sum, F).
fib(N, F) :- fib(N, 0, 1, F).

filter(N) :-
    N < 3999999,
    0 is N mod 2.

main(_) :-
    numlist(2, 100, N),
    maplist(fib, N, F),
    include(filter, F, Ff),
    sumlist(Ff, Ans),
    write(Ans), nl.
