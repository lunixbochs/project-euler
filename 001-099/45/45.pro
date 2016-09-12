#!/usr/bin/env swipl -G32g -Oqg main -s

pentagonal(N) :-
    X is (sqrt(24 * N + 1) + 1) / 6,
    X =:= round(X).

hexagonalI(I, N) :- N is (I * 2 - 1) * I.

main(_) :-
    between(1, inf, I),
    hexagonalI(I, N),
    N > 40755,
    pentagonal(N),
    write(N), nl.
