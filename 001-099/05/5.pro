#!/usr/bin/env swipl -qg main -s

factor(N, F, 1) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.
factor(N, F, 0) :-
    factor(N, F1, 1),
    F is N / F1.
factor(N, F) :- factor(N, F, 0); factor(N, F, 1).

gcd(A, B, G) :-
    setof(F, factor(A, F), AF),
    setof(F, factor(B, F), BF),
    intersection(AF, BF, FL),
    max_member(G, FL), !.

lcm(A, [Last], O) :-
    gcd(A, Last, G),
    O is (A * Last) / G.
lcm(A, [B|T], O) :-
    lcm(A, [B], Acc),
    lcm(Acc, T, O).
lcm([H|T], O) :- lcm(H, T, O).

main(_) :-
    numlist(1, 20, NL),
    lcm(NL, L),
    write(L), nl.
