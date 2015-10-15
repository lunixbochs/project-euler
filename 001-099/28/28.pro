#!/usr/bin/env swipl -G32g -Oqg main -s

spiral_sum(_, Limit, Acc, _, _) :-
    Acc is Limit, !.

spiral_sum(Count, Limit, Acc, Add, [Head|Tail]) :-
    Count mod 4 =:= 0 -> (
        Head is Acc + Add,
        CountN is Count + 1,
        AddN is Add + 2,
        spiral_sum(CountN, Limit, Head, AddN, Tail)
    ); (
        Head is Acc + Add,
        CountN is Count + 1,
        spiral_sum(CountN, Limit, Head, Add, Tail)
    ).

spiral_sum((W, H), Ans) :-
    C is W * H,
    spiral_sum(0, C, 1, 0, Ans).

solve(X) :-
    spiral_sum((1001, 1001), List),
    sum_list(List, X).

main(_) :-
    solve(X),
    write(X), nl.
