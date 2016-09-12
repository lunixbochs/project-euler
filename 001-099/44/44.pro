#!/usr/bin/env swipl -G32g -Oqg main -s

pentagonal(X) :-
    A is (sqrt(24 * X + 1) + 1),
    B is round(A),
    A =:= B, B mod 6 =:= 0.

pentagen(I, N) :- N is I * (3 * I - 1) / 2.

solve(X) :-
    numlist(1, 1000000, NL), maplist(pentagen, NL, PL),
    between(2, inf, AI), BIMax is AI - 1,
    nth0(AI, PL, A), between(0, BIMax, BI), nth0(BI, PL, B),
    C is A + B, D is abs(B - A),
    maplist(pentagonal, [C, D]),
    X is abs(B - A).

main(_) :-
    solve(X),
    write(X), nl.
