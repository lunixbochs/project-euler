#!/usr/bin/env swipl -G32g -Oqg main -s

palindrome(S) :- atom_chars(S, C), reverse(C, C).

radix_palindrome(Start, End, N) :-
    between(Start, End, N),
    atom_number(Base10, N),
    format(atom(Base2), '~2r', N),
    palindrome(Base10), palindrome(Base2).

solve(X) :-
    aggregate(sum(N), radix_palindrome(1, 1000000, N), X).

main(_) :-
    solve(X),
    write(X), nl.
