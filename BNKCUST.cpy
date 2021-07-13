      *> -------------------------------------------
      *> DECLARE TABLE for BNKCUST
      *> -------------------------------------------
           EXEC SQL DECLARE BNKCUST TABLE 
           ( BCS_PID              CHAR(5)      NOT NULL
           , BCS_NAME             CHAR(25)     NOT NULL
           , BCS_NAME_FF          CHAR(25)     NOT NULL
           , BCS_SIN              CHAR(9)      NOT NULL
           , BCS_ADDR1            CHAR(25)     NOT NULL
           , BCS_ADDR2            CHAR(25)     NOT NULL
           , BCS_STATE            CHAR(2)      NOT NULL
           , BCS_COUNTRY          CHAR(6)      NOT NULL
           , BCS_POST_CODE        CHAR(6)      NOT NULL
           , BCS_TEL              CHAR(12)     NOT NULL
           , BCS_EMAIL            CHAR(30)     NOT NULL
           , BCS_SEND_MAIL        CHAR(1)      NOT NULL
           , BCS_SEND_EMAIL       CHAR(1)      NOT NULL
           , BCS_FILLER           CHAR(78)     NOT NULL
           ) END-EXEC.
      *> -------------------------------------------
      *> COBOL HOST VARIABLES FOR TABLE BNKCUST
      *> -------------------------------------------
       01  DCLBNKCUST.
           03 BNKCUST-BCS-PID                 PIC X(5).
           03 BNKCUST-BCS-NAME                PIC X(25).
           03 BNKCUST-BCS-NAME-FF             PIC X(25).
           03 BNKCUST-BCS-SIN                 PIC X(9).
           03 BNKCUST-BCS-ADDR1               PIC X(25).
           03 BNKCUST-BCS-ADDR2               PIC X(25).
           03 BNKCUST-BCS-STATE               PIC X(2).
           03 BNKCUST-BCS-COUNTRY             PIC X(6).
           03 BNKCUST-BCS-POST-CODE           PIC X(6).
           03 BNKCUST-BCS-TEL                 PIC X(12).
           03 BNKCUST-BCS-EMAIL               PIC X(30).
           03 BNKCUST-BCS-SEND-MAIL           PIC X(1).
           03 BNKCUST-BCS-SEND-EMAIL          PIC X(1).
           03 BNKCUST-BCS-FILLER              PIC X(78).
