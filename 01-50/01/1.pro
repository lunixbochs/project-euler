#!/usr/bin/env swipl -qg main -s

solve(X, O) :-
    (0 is X mod 3; 0 is X mod 5), O is X; O is 0.

main(_) :-
    numlist(1, 999, NL),
    maplist(solve, NL, Result),
    sumlist(Result, Sum),
    write(Sum), nl.
