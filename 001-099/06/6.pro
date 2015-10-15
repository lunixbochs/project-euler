#!/usr/bin/env swipl -qg main -s

square(A, O) :- O is A ** 2.

main(_) :-
    numlist(1, 100, NL),
    sum_list(NL, NatSum),
    NatSumSquare is NatSum ^ 2,
    maplist(square, NL, NatSquares),
    sum_list(NatSquares, NatSquaresSum),
    Diff is abs(NatSumSquare - NatSquaresSum),
    write(Diff), nl.
