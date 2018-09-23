ASSUME CS:CODE,DS:DATA
DATA SEGMENT
Msg1 DB "Yes   $"
Msg2 DB "No    $"
Str1 DB "VITCC"
Str2 DB "Malayalam"
DATA ENDS
CODE SEGMENT
START:
     MOV AX,DATA
     MOV DS,AX

     MOV CX,05H    ;Checking for VITCC
     LEA SI,Str1   ;Loading the address of the string
     ADD SI,04H    
     CALL PROC
     ;MOV CX,09H    ;Checking for Malayalam
     ;LEA SI,Str1   ;Loading the address of the string
     ;ADD SI,08H    
     CALL PALI      ;Calling Palindrome function to check
     MOV CX,09H     ;Checking for Malayalam
     LEA SI,Str2
     ADD SI,09H
     CALL PALI
     HLT

PALI:MOV DI,5000H  ;Storing the reverse string from location 5000
L1:  MOV BL,[SI]
     MOV [DI],BL
     DEC SI
     INC DI
     DEC CX
     CMP CX,01H
     JAE L1
     SUB DI,05H  
     MOV CX,05H
L2 : MOV AL,[SI]  ;Checking if the string and it's reverse are equal
     MOV BL,[DI]
     CMP AL,BL
     JNE L3
     DEC CX
     CMP CX,01H   ;Printing Yes or No accordingly
     JAE L2
     MOV AX,00H
     LEA DX,Msg1
     MOV AH,09H
     INT 21H
     RET
L3  :MOV AX,00H
     LEA DX,Msg2
     MOV AH,09H
     INT 21H
     SUB AH,09H
     RET
    
CODE ENDS
END START
