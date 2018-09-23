ASSUME DS:DATA,CS:CODE
DATA SEGMENT
Arr DB 01,02,03,04,05
Num DB 05
DATA ENDS
CODE SEGMENT
START:
     MOV AX,DATA
     MOV DS,AX
     MOV AX,00H ;We would store sum in AX so sum=0
     LEA BX,Arr ;Load the address of first array element in BX
     LEA SI,Num ;Loading address of number of elements in SI
     MOV CX,[SI];Moving the number of elements to CX
L1:  MOV DX,[BX];Moving the element in DX
     ADD AX,DX
     INC BX
     DEC CX
     CMP CX,01H
     JAE L1
     HLT
CODE ENDS
     END START



