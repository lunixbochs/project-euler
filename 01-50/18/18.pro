#!/usr/bin/env swipl -Oqg main -s

lines([])           --> call(eos), !.
lines([Line|Lines]) --> line(Line), lines(Lines).

eos([], []).

line([])     --> ( "\n" ; call(eos) ), !.
line([L|Ls]) --> [L], line(Ls).

parse_line(Line, Out) :-
    atom_codes(Atom, Line),
    atomic_list_concat(Split, ' ', Atom),
    maplist(atom_number, Split, Out).

path_max(Tree, Result) :-
    length(Tree, R),
    nth1(R, Tree, Row),
    path_max(R, Tree, [Row], Result).
path_max(R, Tree, Rows, Result) :-
    R > 0,
    R0 is R - 1,
    row_pair_max(R0, Tree, Row),
    path_max(R0, Tree, Rows, Result),
    write([1, Row|Rows]), nl.
path_max(R, _, Rows, Result) :- R < 0, Result = Rows.
row_pair_max(R, Tree, Out) :-
    row_pair_max(R, R, Tree, [], Out).
row_pair_max(R, C, Tree, New, Out) :-
    write([2, R, C, New]), nl,
    R1 is R + 1, C0 is C - 1, C1 is C + 1,
    C > 0,
    write('C > 0'), nl,
    nth1(R, Tree, Row),
    nth1(R1, Tree, NextRow),
    nth1(C, Row, Item),
    nth1(C, NextRow, Left),
    nth1(C1, NextRow, Right),
    Val is Item + max(Left, Right),
    write(['Left', Left, 'Right', Right, 'Max', Val]), nl,
    row_pair_max(R, C0, Tree, [Val|New], Out).
row_pair_max(_, C, _, New, Out) :-
    C = 0,
    write('C = 0'), nl,
    Out = New.

main(_) :-
    phrase_from_file(lines(Ls), 'input'),
    maplist(parse_line, Ls, Tree),
    path_max(Tree, Result),
    write(Result), nl.
