.MODEL SMALL

DISPLAY MACRO MSG
LEA DX, MSG
MOV AH, 09H
INT 21H
ENDM

.DATA 
    MSG DB 0DH, 0AH, "ENTER ALPHANUMERIC CHAR:$"
    KEY DW 0
.CODE
    MOV AX, @DATA
    MOV DS, AX 

    DISPLAY MSG
    MOV AH, 01H ;ACCEPT CHAR IN AL
    INT 21H
    XOR AH, AH 
    MOV KEY, AX

    MOV AH, 00H ; TO CLEAR SCREEN
    MOV AL, 03H ;
    INT 10H     ;

    MOV DH, 12  ; TO CENTER CURSOR
    MOV DL, 40  ;
    MOV AH, 02H ;
    INT 10H     ;

    MOV AX, KEY
    ADD AX, 00
    AAM
    MOV DL, AH
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    MOV AX, KEY
    ADD AX, 00
    AAM
    MOV DL, AL
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
END