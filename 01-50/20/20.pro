#!/usr/bin/env swipl -G32g -Oqg main -s

fact(0, Ans, Ans) :- !.
fact(N, Acc, Ans) :- N1 is N - 1, Acc1 is Acc * N, fact(N1, Acc1, Ans).
fact(N, Ans) :- fact(N, 1, Ans).

solve(X) :-
    fact(100, Ans),
    number_chars(Ans, Chars),
    maplist(atom_number, Chars, Digits),
    sum_list(Digits, X).

main(_) :-
    solve(X),
    write(X), nl.
