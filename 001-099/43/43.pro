#!/usr/bin/env swipl -G32g -Oqg main -s

divsub(Digits, Start, Prime) :-
    A is Start, B is Start + 1, C is Start + 2,
    nth1(A, Digits, AD), nth1(B, Digits, BD), nth1(C, Digits, CD),
    number_chars(N, [AD, BD, CD]),
    (N mod Prime) =:= 0.

pandigital_substr(N) :-
    numlist(0, 9, NL),
    maplist(atom_number, AL, NL),
    permutation(AL, PL),
    maplist(divsub(PL), [2, 3, 4, 5, 6, 7, 8], [2, 3, 5, 7, 11, 13, 17]),
    number_chars(N, PL),
    write(N), nl.

solve(X) :-
    aggregate(sum(N), pandigital_substr(N), X).

main(_) :-
    solve(X),
    write(X), nl.
