#!/usr/bin/env swipl -G32g -Oqg main -s

pandigital(C) :-
    atom_chars(C, Chars),
    sort(0, @=<, Chars, ['1', '2', '3', '4', '5', '6', '7', '8', '9']).

products0(I, N, P) :- P1 is I * N, atom_number(P, P1).
products(0, _, '').
products(I, N, P) :-
    I > 0,
    products0(I, N, P1),
    I1 is I - 1,
    products(I1, N, P2),
    atom_concat(P2, P1, P).
products(N, P) :-
    atom_number(A, N),
    atom_length(A, L),
    Bound is round(9 / L), Bound > 0,
    between(2, Bound, I),
    products(I, N, P),
    atom_length(P, 9).

pandigital_product(P) :-
    between(2, 100000, N),
    products(N, Pan),
    pandigital(Pan),
    atom_number(Pan, P).

solve(X) :- aggregate(max(P), pandigital_product(P), X).

main(_) :-
    solve(X),
    write(X), nl.
