#!/usr/bin/env swipl -Oqg main -s

/*
% slow recursive version
paths((W, H), R) :- paths((0, 0), (W, H), R).
paths((X, Y), (W, H), R) :-
    (X is W; Y is H) -> R is 1;
    X1 is X + 1, Y1 is Y + 1,
    paths((X1, Y), (W, H), R1),
    paths((X, Y1), (W, H), R2),
    R is R1 + R2.

path0((W, H), R) :- path1((W, H), R).
path1((0, _), 1).
path1((_, 0), 1).

% over the diagonal
path1((X, Y), L) :-
    X > Y,
    X0 is X - 1,
    Y0 is Y - 1,
    path1((X0, Y), L1),
    path1((X, Y0), L2),
    L = L1 + L2.

% diagonal
path1((X, Y), L) :-
    X > 0, X = Y,
    Y1 is Y - 1,
    path1((X, Y1), L1),
    L = L1 * 2.
*/

rowcol(Grid, (Col, Row), N) :-
    nth0(Row, Grid, Line),
    nth0(Col, Line, N).

lattice(W, H, Grid) :-
    lattice(0, (W, H), [], Grid).
lattice(Y, (W, H), Grid, Result) :-
    Y < H, Y1 is Y + 1,
    lattice_row((0, Y), (W, H), Grid, [], Row),
    append(Grid, [Row], Grid1),
    lattice(Y1, (W, H), Grid1, Result).
lattice(_, _, Grid, Result) :- Result = Grid.

lattice_row((X, Y), (W, H), Grid, Row, Result) :-
    X < W, X0 is X + 1,
    append(Row, [V], Row1),
    append(Grid, [Row1], Grid1),
    path1((X, Y), Grid1, V),
    lattice_row((X0, Y), (W, H), Grid, Row1, Result).
lattice_row(_, _, _, Row, Result) :- Result = Row.

path0((W, H), R) :-
    lattice(W, H, Grid),
    X is W - 1, Y is H - 1,
    rowcol(Grid, (Y, X), R).
path1((0, _), _, 1).
path1((_, 0), _, 1).
path1((X, Y), Grid, L) :-
    % under
    X < Y -> rowcol(Grid, (Y, X), L);
    % over
    X > Y -> (
        X0 is X - 1,
        Y0 is Y - 1,
        rowcol(Grid, (X0, Y), L1),
        rowcol(Grid, (X, Y0), L2),
        L is L1 + L2
    );
    % diagonal
    (X > 0, X = Y) -> (
        Y1 is Y - 1,
        path1((X, Y1), Grid, L1),
        L is L1 * 2
    ).

% list all coordinate pairs in a 2d array (unrelated)
coord_2d(W, H, L) :-
    X is W - 1, Y is H - 1,
    coord_2d((X, Y), (W, H), [], L).
coord_2d((X, Y), (W, H), L, Result) :-
    X > 0,
    X1 is X - 1,
    coord_2d((X1, Y), (W, H), [[Y, X]|L], Result).
coord_2d((X, Y), (W, H), L, Result) :-
    X = 0, Y > 0,
    X1 is W - 1, Y1 is Y - 1,
    coord_2d((X1, Y1), (W, H), [[Y, X]|L], Result).
coord_2d((0, 0), (_, _), L, Result) :- Result = [[0, 0]|L].

main(_) :-
    path0((20, 20), R),
    write(R), nl.
