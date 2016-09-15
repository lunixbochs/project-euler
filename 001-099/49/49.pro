#!/usr/bin/env swipl -G32g -Oqg main -s

factor(N, F, 1) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.
factor(N, F, 0) :-
    factor(N, F1, 1),
    F is N / F1.
factor(N, F) :- factor(N, F, 0); factor(N, F, 1).
isprime(N) :- setof(F, factor(N, F), [1, N]).

nlton(NL, N) :- maplist(atom_number, AL, NL), number_chars(N, AL).
ntonl(N, NL) :- atom_number(A, N), atom_chars(A, AL), maplist(atom_number, AL, NL).

solve(X) :-
    numlist(1000, 9999, NL),
    include(isprime, NL, PL),

    maplist(member, [N1, N2], [PL, PL]),
    N2 > N1,
    N3 is N2 + (N2 - N1), N3 < 10000,
    isprime(N3),
    maplist(ntonl, [N1, N2, N3], [L1, L2, L3]),
    maplist(permutation, [L1, L1], [L2, L3]),

    append(L1, L2, L12), append(L12, L3, L123),
    nlton(L123, X).

main(_) :-
    setof(N, solve(N), X),
    write(X), nl.
