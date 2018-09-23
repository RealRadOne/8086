ASSUME CS:CODE,DS:DATA
DATA SEGMENT
Msg1 DB  "ENTER THE COUNT:$"
Msg2 DB  "Enter the number:$"
DATA ENDS
CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX

    LEA DX,Msg1 ;Printing the first message
    MOV AH,09H
    INT 21H

    SUB AH,09H  ;Returning the value of AH back

    MOV AH,01H  ;Taking the count as input from user
    INT 21H

    SUB AH,01H ;Converting the ASCII to decimal and storing it in AX
    SUB AL,30H

    MOV CX,AX   ;Setting the counter

    MOV AX,00H  ;Setting the value of AX back
    MOV BX,00H  ;BX would store the sum
    LEA DX,Msg2 ;Loading the next message for printing   

L1: MOV AH,09H  ;Printing the second message
    INT 21H

    SUB AH,09H  ;Returning the value that AH had

    MOV AH,01H  ;Taking number input from user
    INT 21H

    SUB AH,01H  ;Converting from ASCII to decimal
    SUB AL,30H

    ADD BX,AX
    DEC CX
    CMP CX,01H
    JAE L1
    HLT
CODE ENDS
END START

     
