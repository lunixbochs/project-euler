#!/usr/bin/env swipl -G32g -Oqg main -s

triangles(N, (A, B, C)) :-
    B = N - C - A,
    SN is round(sqrt(N)),
    N1 is N - 1,
    between(SN, N1, C),
    C1 is C - 1,
    between(2, C1, A),
    B > 0,
    A ** 2 + B ** 2 =:= C ** 2.

triangle_range(Start, End, Out) :-
    between(Start, End, N),
    aggregate(count, Tri, triangles(N, Tri), Tris),
    Out = [N, Tris].

max3(A, [], A).
max3(A, B, C) :-
    nth0(1, A, A1), nth0(1, B, B1),
    A1 > B1 -> C = A; C = B.

solve(X) :-
    bagof(N, triangle_range(2, 1000, N), Counts),
    foldl(max3, Counts, [], Max),
    nth0(0, Max, X).

main(_) :-
    solve(X),
    write(X), nl.
