#!/usr/bin/env swipl -Oqg main -s

num_word(N, Word) :-
    N < 10 -> nth0(N, ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'], Word);
    N < 20 -> (
        N1 is N - 10,
        nth0(N1, ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'], Word)
    );
    N < 100 -> (
        N1 is floor((N - 20) / 10),
        nth0(N1, ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'], First),
        Nm is N mod 10,
        (Nm > 0 -> (
            num_word(Nm, Second),
            atomic_list_concat([First, Second], ' ', Word)
        ); Word = First)
    );
    N < 1000 -> (
        N1 is floor(N / 100),
        num_word(N1, First),
        Nm is N mod 100,
        (Nm > 0 -> (
            num_word(Nm, Second),
            atomic_list_concat([First, 'hundred and', Second], ' ', Word)
        ); atomic_list_concat([First, 'hundred'], ' ', Word))
    );
    N = 1000 -> Word = 'one thousand'.

nospace_length(S, Length) :-
    atomic_list_concat(Words, ' ', S),
    maplist(atom_length, Words, Lengths),
    sum_list(Lengths, Length).

main(_) :-
    numlist(1, 1000, NL),
    maplist(num_word, NL, WL),
    maplist(nospace_length, WL, LL),
    sum_list(LL, O),
    write(O), nl.
