#!/usr/bin/env swipl -Oqg main -s

main(_) :-
    X is 2 ** 1000,
    number_chars(X, Chars),
    maplist(last, CharLists, Chars),
    maplist(number_chars, NumList, CharLists),
    sum_list(NumList, O),
    write(O), nl.
