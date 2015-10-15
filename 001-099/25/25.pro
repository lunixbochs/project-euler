#!/usr/bin/env swipl -Oqg main -s

numlen(N, L) :-
    atom_number(A, N),
    atom_length(A, L).

fib(N, A, B, Result) :-
    Sum is A + B,
    numlen(Sum, 1000) ->
        Result = N;
        Sum is A + B,
        N1 is N + 1,
        fib(N1, B, Sum, Result).

fib(F) :- fib(1, 1, 0, F).

main(_) :-
    fib(X),
    write(X), nl.
