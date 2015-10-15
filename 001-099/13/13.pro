#!/usr/bin/env swipl -Oqg main -s

lines([])           --> call(eos), !.
lines([Line|Lines]) --> line(Line), lines(Lines).

eos([], []).

line([])     --> ( "\n" ; call(eos) ), !.
line([L|Ls]) --> [L], line(Ls).

main(_) :-
    phrase_from_file(lines(Ls), 'input'),
    maplist(atom_codes, As, Ls),
    maplist(atom_number, As, Ns),
    sum_list(Ns, N),
    atom_number(A, N),
    sub_atom(A, 0, 10, _, S),
    write(S), nl.
