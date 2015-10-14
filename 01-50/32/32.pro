#!/usr/bin/env swipl -G32g -Oqg main -s

pandigital(C) :-
    between(1, 100, A),
    between(A, 5000, B),
    C is A * B,
    maplist(number_chars, [A, B, C], CharList),
    append(CharList, Chars),
    sort(0, @=<, Chars, ['1', '2', '3', '4', '5', '6', '7', '8', '9']).

solve(X) :-
    setof(C, pandigital(C), Set),
    sumlist(Set, X).

main(_) :-
    solve(X),
    write(X), nl.
