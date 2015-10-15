#!/usr/bin/env swipl -Oqg main -s

triplet(A, B, C, Product) :-
    A ** 2 + B ** 2 =:= C ** 2,
    Product is A * B * C.

main(_) :-
    between(1, 1000, A),
    between(A, 1000, B),
    C is 1000 - A - B,
    A < C, B < C,
    aggregate(max(Product), triplet(A, B, C, Product), X),
    write(X), nl.
