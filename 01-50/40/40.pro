#!/usr/bin/env swipl -G32g -Oqg main -s

mult(A, B, C) :- C is A * B.

lookup(Atom, Idx, Val) :-
    I0 is Idx - 1,
    sub_atom(Atom, I0, 1, _, Sub),
    atom_number(Sub, Val).

solve(X) :-
    numlist(1, 1000000, NL),
    atomic_list_concat(NL, Digits),
    maplist(lookup(Digits), [1, 10, 100, 1000, 10000, 100000, 1000000], Terms),
    foldl(mult, Terms, 1, X).

main(_) :-
    solve(X),
    write(X), nl.
