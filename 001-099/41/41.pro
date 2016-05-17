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

pandigital_prime(Range, N) :-
    numlist(1, Range, NL),
    maplist(atom_number, AL, NL),
    permutation(AL, PL),
    number_chars(N, PL),
    isprime(N).

solve(X) :-
    aggregate(max(N), pandigital_prime(7, N), X).

main(_) :-
    solve(X),
    write(X), nl.
