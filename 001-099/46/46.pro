#!/usr/bin/env swipl -G32g -Oqg main -s

factor(N, F, 1) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.
factor(N, F, 0) :-
    factor(N, F1, 1),
    F is N / F1.
factor(N, F) :- factor(N, F, 0); factor(N, F, 1).
isprime(N) :- setof(F, factor(N, F), [1, N]).

composite(N) :- N > 1, not(isprime(N)).
nodecimal(N) :- float_fractional_part(N) =:= 0.

goldbach(N) :-
    between(1, N, Prime),
    isprime(Prime),
    nodecimal(sqrt(((N - Prime) / 2))).

solve(N) :-
    between(1, inf, N),
    N mod 2 =:= 1,
    composite(N),
    not(goldbach(N)).

main(_) :-
    solve(N),
    write(N), nl.
