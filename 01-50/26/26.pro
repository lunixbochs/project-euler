#!/usr/bin/env swipl -Oqg main -s

rlen(I, A, L) :-
    atom_length(A, Len),
    I = Len -> L is 1;
    (
        IB is I + 2,
        sub_atom(A, 2, I, _, AA),
        sub_atom(A, IB, I, _, AB),
        AA = AB -> L is I + 1;
        (I1 is I + 1, rlen(I1, A, L))
    ).

rlen(D, L) :-
    N is 1 rdiv D,
    format(atom(Ns), '~2000f', [N]),
    rlen(2, Ns, L).

solve(X) :-
    numlist(1, 1000, NL),
    maplist(rlen, NL, Lengths),
    max_list(Lengths, X).

main(_) :-
    solve(X),
    write(X), nl.
