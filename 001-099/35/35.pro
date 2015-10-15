#!/usr/bin/env swipl -G32g -Oqg main -s

rotation(A, B) :-
    atom_length(A, Len),
    atom_concat(A, A, C),
    sub_atom(C, 0, _, 1, D),
    sub_atom(D, _, Len, _, B).

factor(N, F, 1) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.
factor(N, F, 0) :-
    factor(N, F1, 1),
    F is N / F1.
factor(N, F) :- factor(N, F, 0); factor(N, F, 1).
isprime(N) :- setof(F, factor(N, F), [1, N]).

circular_prime(N) :-
    atom_number(A, N),
    setof(B, rotation(A, B), RotAtoms),
    maplist(atom_number, RotAtoms, RotNums),
    maplist(isprime, RotNums).

circular_prime_bounded(Start, End, N) :- between(Start, End, N), circular_prime(N).

solve(X) :- aggregate(count, N, circular_prime_bounded(2, 1000000, N), X).

main(_) :-
    solve(X),
    write(X), nl.
