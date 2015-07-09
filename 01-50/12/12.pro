#!/usr/bin/env swipl -Oqg main -s

factor(N, F, 1) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.
factor(N, F, 0) :-
    factor(N, F1, 1),
    F is N / F1.
factor(N, F) :- factor(N, F, 0); factor(N, F, 1).

triangle(N, T) :-
    aggregate(sum(X), between(1, N, X), T).

main(_) :-
    between(1, inf, N),
    triangle(N, T),
    aggregate_all(sum(1), factor(T, _), A),
    write([N, T, A]), nl,
    A > 500,
    write(T), nl.
