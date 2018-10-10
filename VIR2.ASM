ASSUME CS:CODE,DS:DATA
DATA SEGMENT
Msg1 DB "Enter the n value:$"
Msg2 DB "Enter the x value:$"
DATA ENDS
CODE SEGMENT
START:
     MOV AX,DATA
     MOV DS,AX
     
     LEA DX,Msg1  ;Printing the first message
     MOV AH,09H
     INT 21H

     SUB AH,09H

     MOV AH,01H  ;Taking the input of n
     INT 21H
      
     SUB AH,01H  ;Converting the ASCII value to decimal
     SUB AL,30H

     MOV BX,AX   ;Putting the n value in BX Register(n)
    
     LEA DX,Msg2 ;Printing the second message
     MOV AH,09H
     INT 21H

     SUB AH,09H

     MOV AH,01H ;Taking user input for x
     INT 21H

     SUB AH,01H ;Converting the ASCII value to decimal
     SUB AL,30H
    
     MOV DX,AX  ;DX=x
     MOV AX,BX  ;AX=n and BX=n
     SUB AX,DX  ;AX=n-x
     MOV SI,2000H
     MOV [SI],BX ;2000H=n
     MOV BX,AX  ;BX=n-x
     CALL FACT
     MOV DX,AX  ;DX=(n-x)!
     MOV BX,[SI]
     MOV [SI],DX;2000H=(n-x)!
     CALL FACT  ;AX=n!
     MOV BX,[SI];BX=(n-x)!
     DIV BX    ;AX=n!/(n-x)!
     HLT

FACT PROC NEAR
     MOV CX,BX     ;Computes (n)!
     MOV AX,01H
L1  :MUL CX
     DEC CX
     CMP CX,01H
     JAE L1
     RET
     FACT ENDP

CODE ENDS
END START

