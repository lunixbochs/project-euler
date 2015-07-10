VARIABLE SUM
: run
    0 SUM !
    1000 1 DO
        I 5 MOD
        0 = IF
            I SUM @ + SUM !
        ELSE
            I 3 MOD
            0 = IF I SUM @ + SUM ! THEN
        THEN
    LOOP
    SUM @ . CR ;
run
bye
