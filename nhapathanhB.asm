ORG 100H  
   
 L1:
   MOV AH, 0
   INT 16H          ; NHAP 1 KI TU, LUU VAO AL  
   
   TEST AL, 3
   JZ EXIT                     
   
   SUB AL, 31       ; TRU DI DE THAY DOI KI TU IN RA MAN HINH 
   MOV DL, AL 
   MOV AH, 2
   INT 21H
   JMP L1
   
 EXIT:
   MOV AH, 4CH
   INT 21H  
   
RET