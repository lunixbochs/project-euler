#!/usr/bin/env swipl -G32g -Oqg main -s

pow(Start, End, C) :-
    between(Start, End, A),
    between(Start, End, B),
    C is A ** B.

solve(Start, End, X) :-
    setof(C, pow(Start, End, C), List),
    length(List, X).

main(_) :-
    solve(2, 100, X),
    write(X), nl.
