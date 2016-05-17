#!/usr/bin/env swipl -G32g -Oqg main -s

triangle(N) :- triangle(N, 1).
triangle(N, I) :-
    X is (I * 0.5) * (I + 1),
    triangle1(N, X, I).
triangle1(N, X, _) :- N =:= X.
triangle1(N, X, I) :- N > X, I1 is I + 1, triangle(N, I1).

codemap(C, N) :- N is C - 64.

triangle_word(Word) :-
    atom_codes(Word, Codes),
    maplist(codemap, Codes, Nums),
    sum_list(Nums, N),
    triangle(N).

solve(Words, N) :-
    include(triangle_word, Words, Triangles),
    length(Triangles, N).

main(_) :-
    csv_read_file('input', Rows), nth0(0, Rows, Row),
    Row =.. [_ | Cols],
    solve(Cols, N),
    write(N), nl.
