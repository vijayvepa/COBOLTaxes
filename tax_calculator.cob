       IDENTIFICATION DIVISION.
       PROGRAM-ID. TAXCALC.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE ASSIGN TO 'balances.txt'.
           SELECT OUTFILE ASSIGN TO 'taxes.txt'.
       DATA DIVISION.
       FILE SECTION.
       FD  INFILE.
       01  IN-REC.
           05  IN-BALANCE     PIC 9(9)V99.
       FD  OUTFILE.
       01  OUT-REC.
           05  OUT-BALANCE    PIC 9(9)V99.
           05  OUT-TAX        PIC 9(9)V99.
       WORKING-STORAGE SECTION.
       01  WS-TAX-RATE        PIC V99 VALUE 0.10.
       01  WS-EOF             PIC X VALUE 'N'.
       01  WS-BALANCE         PIC 9(9)V99.
       01  WS-TAX             PIC 9(9)V99.
       PROCEDURE DIVISION.
       BEGIN.
           OPEN INPUT INFILE OUTPUT OUTFILE
           PERFORM UNTIL WS-EOF = 'Y'
               READ INFILE
                   AT END
                       MOVE 'Y' TO WS-EOF
                   NOT AT END
                       MOVE IN-BALANCE TO WS-BALANCE
                       COMPUTE WS-TAX = WS-BALANCE * WS-TAX-RATE
                       MOVE WS-BALANCE TO OUT-BALANCE
                       MOVE WS-TAX TO OUT-TAX
                       WRITE OUT-REC
               END-READ
           END-PERFORM
           CLOSE INFILE OUTFILE
           STOP RUN.
