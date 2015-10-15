#!/usr/bin/env swipl -qg main -s

mult35(Start, End, X) :-
    between(Start, End, X),
    (X mod 3 =:= 0; X mod 5 =:= 0).

main(_) :-
    aggregate(sum(X), X, mult35(1, 999, X), Sum),
    write(Sum), nl.
