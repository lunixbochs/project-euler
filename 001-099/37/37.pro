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

truncate(A, B) :- sub_atom(A, 0, _, _, B).
truncate(A, B) :- sub_atom(A, _, _, 0, B).
truncate_num(N, T) :-
    atom_number(A, N),
    truncate(A, B),
    atom_number(B, T),
    N =\= T.

truncatable_prime(N) :-
    between(1, inf, N),
    isprime(N),
    setof(T, truncate_num(N, T), Trunc),
    maplist(isprime, Trunc).

solve(X) :-
    aggregate(sum(N), limit(11, truncatable_prime(N)), X).

main(_) :-
    solve(X),
    write(X), nl.
