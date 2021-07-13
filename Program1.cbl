      $SET XDB sourceformat(variable) 
       WORKING-STORAGE SECTION. 
       
           EXEC SQL INCLUDE SQLCA  END-EXEC. 
       
      *> after an sql error this has the full message text
       01 MFSQLMESSAGETEXT  PIC X(250). 
       01 IDX               PIC X(04)  COMP-5. 
       
           EXEC SQL BEGIN DECLARE SECTION  END-EXEC 
       *> Put your host variables here if you need to port 
       *> to other COBOL compilers 
            EXEC SQL INCLUDE BNKCUST END-EXEC.
       
       
           EXEC SQL END DECLARE SECTION END-EXEC 
       
       PROCEDURE DIVISION.
       
           EXEC SQL 
               WHENEVER SQLERROR GOTO OpenESQL-Error 
            END-EXEC
       
       *> Put your program logic/SQL statements here 
            EXEC SQL 
            DECLARE CSR3 CURSOR FOR SELECT 
                   A.BCS_PID
                  ,A.BCS_NAME
                  ,A.BCS_TEL
              FROM MFUSER.BNKCUST A
             ORDER BY A.BCS_NAME
           END-EXEC 
           EXEC SQL 
              OPEN CSR3
           END-EXEC 
           PERFORM UNTIL SQLCODE < 0 OR SQLCODE = +100 
              EXEC SQL 
                FETCH CSR3  INTO 
                   :BNKCUST-BCS-PID
                  ,:BNKCUST-BCS-NAME
                  ,:BNKCUST-BCS-TEL
              END-EXEC 
              *> Process data from the Fetch
              IF SQLCODE = 0 
           
              *> DISPLAY 'ROW FOUND' 

                   DISPLAY BNKCUST-BCS-PID ' ' 
                     BNKCUST-BCS-NAME ' '
                     BNKCUST-BCS-TEL
              *> for array fetches, field sqlerrd(3) contains
              *> the number of rows returned 
              *>   PERFORM VARYING IDX FROM 1 BY 1 
              *>     UNTIL IDX > SQLERRD(3)
           
              *>   you will need to add code here to process the array 
           
              *>   END-PERFORM 
              END-IF 
           END-PERFORM 
           STOP ' '
           EXEC SQL 
             CLOSE CSR3
           END-EXEC 
           

           EXIT PROGRAM. 
           STOP RUN. 
       *> Default sql error routine / modify to stop program if needed 
       OpenESQL-Error Section.
       
            display "SQL Error = " sqlstate " " sqlcode 
            display MFSQLMESSAGETEXT 
           stop run. 
       
       