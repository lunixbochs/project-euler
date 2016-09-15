#!/usr/bin/env swipl -G32g -Oqg main -s

codemap(C, N) :- N is C - 64.

score(Word, Idx, N) :-
    atom_codes(Word, Codes),
    maplist(codemap, Codes, Nums),
    sum_list(Nums, A),
    N is A * Idx.

solve(Words, N) :-
    length(Words, Len),
    numlist(1, Len, Idx),
    maplist(score, Words, Idx, Scores),
    sum_list(Scores, N).

main(_) :-
    csv_read_file('input', Rows), nth0(0, Rows, Row),
    Row =.. [_ | Cols],
    sort(Cols, Sorted),
    solve(Sorted, N),
    write(N), nl.
