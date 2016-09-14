#!/usr/bin/env swipl -G32g -Oqg main -s

factor(N, F, 1) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.
factor(N, F, 0) :-
    factor(N, F1, 1),
    F is N / F1.
factor(N, F) :- factor(N, F, 0); factor(N, F, 1).
isprime(N) :- setof(F, factor(N, F), [1, N]).

prime_factor(N, F) :-
    factor(N, F),
    isprime(F).
prime_factors(1, [1]).
prime_factors(N, FL) :-
    setof(F, prime_factor(N, F), FL).

/*
consecutive_primes(N, Length) :-
    N1 is N + Length - 1,
    numlist(N, N1, NL),
    maplist(prime_factors, NL, NF),
    length(NL, L), length(LL, L), maplist(=(Length), LL),
    maplist(length, NF, LL).
*/

consecutive_primes(N, Length) :-
    numlist(1, 150000, NL),
    maplist(prime_factors, NL, NF),
    nth0(_, NL, I),
    consecutive_primes(I, NF, Length, Length),
    N is I + 1.

consecutive_primes(_, _, _, 0).
consecutive_primes(I, NF, Length, Count) :-
    I1 is I + 1, Count1 is Count - 1,
    nth0(I, NF, F),
    length(F, Length),
    consecutive_primes(I1, NF, Length, Count1).

solve(N) :-
    consecutive_primes(N, 4).

main(_) :-
    solve(N),
    write(N), nl.
