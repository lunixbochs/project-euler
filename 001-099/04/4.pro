#!/usr/bin/env swipl -qg main -s

fast_palindrome(S) :-
    atom_length(S, L),
    L1 is L - 1,
    fast_palindrome(S, 0, L1).
fast_palindrome(S, A, B) :-
    sub_atom(S, A, 1, _, S1),
    sub_atom(S, B, 1, _, S2),
    S1 = S2,
    A1 is A + 1, B1 is B - 1,
    ((B1 @=< A1, !); fast_palindrome(S, A1, B1)).

is_palindrome(S) :-
    atom_chars(S, S1),
    reverse(S1, RS),
    S1 = RS.

palindrome_products(Start, End, Pr) :-
    between(Start, End, A),
    between(Start, End, B),
    Product is A * B,
    atom_number(P, Product),
    fast_palindrome(P),
    atom_number(P, Pr).

main(_) :-
    aggregate(max(P), palindrome_products(100, 999, P), N),
    write(N), nl.
