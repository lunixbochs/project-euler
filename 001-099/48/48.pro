#!/usr/bin/env swipl -G32g -Oqg main -s

power(N, O) :- O is N ** N.

solve(X) :-
    numlist(1, 1000, NL),
    maplist(power, NL, PL),
    sum_list(PL, Sum),
    atom_number(Tmp, Sum),
    sub_atom(Tmp, _, 10, 0, X).

main(_) :-
    solve(X),
    write(X), nl.
