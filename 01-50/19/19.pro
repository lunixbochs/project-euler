#!/usr/bin/env swipl -G32g -Oqg main -s

examples(Y, M) :-
    between(1901, 2000, Y),
    between(1, 12, M),
    day_of_the_week(date(Y, M, 1), 7).

main(_) :-
    setof([Y, M], examples(Y, M), Months),
    length(Months, Count),
    write(Count), nl.
