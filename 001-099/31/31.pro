#!/usr/bin/env swipl -G32g -Oqg main -s

coinpurse(X) :- member(X, [1, 2, 5, 10, 20, 50, 100, 200]).

twopound([], X, _) :- X = 0.
twopound([Head|Tail], X, Min) :-
    X > 0,
    coinpurse(Head),
    Head =< Min,
    X1 is X - Head,
    Min2 is min(Head, Min),
    twopound(Tail, X1, Min2).
twopound(List) :- twopound(List, 200, 200).

solve(X) :- aggregate_all(count, twopound(_), X).

main(_) :-
    solve(X),
    write(X), nl.
