#!/usr/bin/env swipl -G32g -Oqg main -s

pow5(A, B) :- B is A ** 5.

sum5(N, Sum) :-
    number_chars(N, Chars),
    maplist(atom_number, Chars, Digits),
    maplist(pow5, Digits, Pows),
    sum_list(Pows, Sum).

sumeq(Start, End, N) :-
    between(Start, End, N),
    sum5(N, N).

solve(X) :-
    setof(N, sumeq(2, 200000, N), NL),
    sum_list(NL, X).

main(_) :-
    solve(X),
    write(X), nl.
