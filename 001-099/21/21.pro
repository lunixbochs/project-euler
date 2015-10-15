#!/usr/bin/env swipl -G32g -Oqg main -s

divisor(N, D) :-
    Bound is round(N / 2),
    between(1, Bound, D),
    N mod D =:= 0.
divisor_sum(N, M) :- aggregate(sum(D), D, divisor(N, D), M).

amicable_pair(N, M) :- divisor_sum(N, M), divisor_sum(M, N).
amicable_bound(Start, End, N) :-
    between(Start, End, N),
    amicable_pair(N, M), N =\= M.

solve(X) :- aggregate(sum(N), N, amicable_bound(1, 10000, N), X).

main(_) :-
    solve(X),
    write(X), nl.
