#!/usr/bin/env escript
main(_) ->
    io:format("~w\n",
        [lists:sum([N || N <- lists:seq(1, 999),
            (N rem 5 == 0) or (N rem 3 == 0)])]).
