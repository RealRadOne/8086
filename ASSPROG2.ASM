ASSUME CS:CODE,DS:DATA
DATA SEGMENT
Msga DB "String1 is:Hai and String2 is:Hello$"
Stra DB "Hai$"
Strb DB "Hello$"
Msgb DB "Moving SI to the end for first string$"
DATA ENDS
CODE SEGMENT
START:
     MOV AX,DATA
     MOV DS,AX

     LEA DX,Msga ;Printing the initial message
     MOV AH,09H
     INT 21H

     MOV CX,03H  ;Setting the counter for first string
     LEA SI,Stra
     MOV DI,5000H

L1  :MOV BX,[SI];Storing the first string in location 5000H
     MOV [DI],BX
     INC SI
     INC DI
     DEC CX
     CMP CX,01H
     JAE L1
     
     LEA  SI,Strb
     MOV  CX,05H

L2  :MOV BX,[SI] ;Adding the second string in the location
     MOV [DI],BX
     INC SI
     INC DI
     DEC CX
     CMP CX,01H
     JAE L2
     HLT
CODE ENDS
END START


