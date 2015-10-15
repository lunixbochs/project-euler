#!/usr/bin/env swipl -qg main -s

factor(N, F) :- F is N.
factor(N, F) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.

isprime(N) :-
    setof(F, factor(N, F), NF),
    NF = [1, N].

prime_factors(N, F) :-
    factor(N, F),
    isprime(F).

main(_) :-
    setof(F, prime_factors(600851475143, F), L),
    last(L, O),
    write(O), nl.
