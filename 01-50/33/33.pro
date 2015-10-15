#!/usr/bin/env swipl -G32g -Oqg main -s

examples(Frac) :-
    between(1, 9, A), between(A, 9, B), A =\= B,
    between(1, 9, Extra),
    A1 is A * 10 + Extra, A2 is A + Extra * 10,
    B1 is B * 10 + Extra, B2 is B + Extra * 10,
    member(AX, [A1, A2]), member(BX, [B1, B2]),
    Frac is AX rdiv BX,
    Frac =:= A rdiv B.

prod(A, B, C) :- C is A * B.

solve(D) :-
    bagof(F, examples(F), Ex),
    foldl(prod, Ex, 1, Prod),
    rational(Prod, _, D).

main(_) :-
    solve(X),
    write(X), nl.
