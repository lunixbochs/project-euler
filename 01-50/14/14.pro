#!/usr/bin/env swipl -Oqg main -s

collatz_rule(N, N1) :-
    M is N mod 2,
    M is 0 -> N1 is N / 2;
    N1 is 3 * N + 1.

collatz(N, Result) :- collatz(N, [1], Result).
collatz(N, Chain, Result) :-
    N = 1 -> length(Chain, Result);
    collatz_rule(N, N1),
    collatz(N1, [N|Chain], Result).

main(_) :-
    numlist(1, 1000000, NL),
    maplist(collatz, NL, X),
    max_list(X, Max),
    write(Max), nl.
