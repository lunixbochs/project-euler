#!/usr/bin/env swipl -G32g -Oqg main -s

digitmatch(A, B) :-
    maplist(number_chars, [A, B], [AC, BC]),
    sort(AC, AS), sort(BC, AS).

mult(A, B, C) :- C is A * B.

digitmatch6(N) :-
    numlist(2, 6, NL),
    maplist(mult(N), NL, ML),
    maplist(digitmatch(N), ML).

solve(X) :-
    between(1, inf, X),
    digitmatch6(X).

main(_) :-
    solve(X),
    write(X), nl.
