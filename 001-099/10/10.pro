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

% I shamelessly stole this code from http://rosettacode.org/wiki/Sieve_of_Eratosthenes#Prolog and should rewrite it from scratch
:- dynamic( composite/1 ).

between(Min, Max, By, I) :- 
    Min =< Max, 
    A is Min + By, 
    (I = Min; between(A, Max, By, I) ).

% %sieve( +N, -Primes ) is true if Primes is the list of consecutive primes
% that are less than or equal to N
sieve( N, [2|Rest]) :-
  retractall( composite(_) ),
  sieve( N, 2, Rest ) -> true.  % only one solution
 
% sieve P, find the next non-prime, and then recurse:
sieve( N, P, [I|Rest] ) :-
  sieve_once(P, N),
  (P = 2 -> P2 is P+1; P2 is P+2),
  between(P2, N, I), 
  (composite(I) -> fail; sieve( N, I, Rest )).
 
% It is OK if there are no more primes less than or equal to N:
sieve(_, _, []).
 
sieve_once(P, N) :-
  forall( between(P, N, P, IP),
          (composite(IP) -> true ; assertz( composite(IP) )) ).

main(_) :-
    sieve(2000000, PL),
    sum_list(PL, X),
    write(X), nl.
