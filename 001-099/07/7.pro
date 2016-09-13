#!/usr/bin/env swipl -Oqg main -s

factor(N, F, 1) :-
    N2 is floor(sqrt(N)),
    between(1, N2, F),
    (N mod F) =:= 0.
factor(N, F, 0) :-
    factor(N, F1, 1),
    F is N / F1.
factor(N, F) :- factor(N, F, 0); factor(N, F, 1).

isprime(N) :-
    setof(F, factor(N, F), NF),
    NF = [1, N].

generate_primes(Max, Result) :-
    between(1, inf, N),
    generate_primes(N, Max, [], Result).
generate_primes(N, Max, Primes, Result) :-
    isprime(N), !,
    length(Primes, X),
    ((X = Max, Result = Primes);
    (N1 is N + 1, generate_primes(N1, Max, [N | Primes], Result))).
generate_primes(N, Max, Primes, Result) :-
    N1 is N + 1,
    generate_primes(N1, Max, Primes, Result).

/*
this prime sieve method works but isn't optimal.
I should reimplement it using retract() and a dynamic predicate ("x is composite")
*/

multiples(N, Limit, Result) :-
    Over is Limit mod N,
    Init is Limit - Over,
    multiples(Init, N, Limit, [], Result).
multiples(A, N, Limit, Working, Result) :-
    A1 is A - N,
    (A1 < N, Result = Working, !;
    multiples(A1, N, Limit, [A1 | Working], Result)).

prime_sieve(Num, Limit, Result) :-
    prime_sieve(2, Limit, Num, [], [], Result).
prime_sieve(N, Limit, Num, Primes, Sieve, Result) :-
    not(member(N, Sieve)), !,
    multiples(N, Limit, Multiples),
    length(Primes, X),
    ((X = Num, Result = Primes); (
        ord_union(Sieve, Multiples, NewSieve),
        N1 is N + 1,
        prime_sieve(N1, Limit, Num, [N | Primes], NewSieve, Result))).
prime_sieve(N, Limit, Num, Primes, Sieve, Result) :-
    member(N, Sieve), !,
    N1 is N + 1,
    prime_sieve(N1, Limit, Num, Primes, Sieve, Result).

main(_) :-
    /* prime_sieve(10001, 120000, Result), */
    generate_primes(10001, Result),
    member(N, Result),
    write(N), nl.
