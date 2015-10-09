#!/usr/bin/env swipl -Oqg main -s

num_perm(N, NL) :-
    permutation(P, NL),
    number_chars(N, P).

solve(X) :-
    numlist(0, 9, NL),
    maplist(atom_number, NA, NL),
    setof(N, num_perm(N, NA), L),
    nth1(1000000, L, X).

main(_) :-
    solve(X),
    write(X), nl.
