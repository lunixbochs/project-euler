#!/usr/bin/env swipl -G32g -Oqg main -s

triangle(N) :-
    X is N * 2,
    A is floor(sqrt(X)), B is ceil(sqrt(X)),
    A =:= B - 1,
    A / 2 * B =:= N.

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
