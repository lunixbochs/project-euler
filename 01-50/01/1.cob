       IDENTIFICATION DIVISION.
       PROGRAM-ID. euler.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Counters.
         02 Total PIC 999999.
         02 I PIC 9999.
         02 C PIC 9.
         02 R1 PIC 9.
         02 R2 PIC 9.
       PROCEDURE DIVISION.
       PERFORM VARYING I FROM 0 BY 1 UNTIL I > 999
           DIVIDE I BY 5 GIVING C REMAINDER R1
           DIVIDE I BY 3 GIVING C REMAINDER R2
           IF R1 EQUAL 0 OR R2 EQUAL 0 THEN
               ADD I TO Total
           END-IF
       END-PERFORM.
       DISPLAY Total
       STOP RUN.
