       IDENTIFICATION DIVISION.
       PROGRAM-ID. euler.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Counters.
         02 I PIC 9999999.
         02 A PIC 9999999 VALUE 0.
         02 B PIC 9999999 VALUE 1.
         02 C PIC 9999999.
         02 TMP PIC 9999999.
         02 R PIC 9999999.
         02 Total PIC 9999999.
       PROCEDURE DIVISION.
       PERFORM VARYING I FROM 0 BY 1 UNTIL I > 4000000
           MOVE A TO TMP
           MOVE B TO A
           ADD TMP TO B

           DIVIDE B BY 2 GIVING C REMAINDER R
           IF R EQUAL 0 THEN
               ADD B TO Total
           END-IF
       END-PERFORM.
       DISPLAY Total
       STOP RUN.
