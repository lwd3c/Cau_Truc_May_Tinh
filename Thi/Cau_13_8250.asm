
;19/04/2024-Xuan-BMTD/V6
org 100h

    MOV AH, 00H
    MOV DX, 00H ;COM1
    MOV AL, 0E3H;9600,N,8,1
    INT 14H    
        
    MOV CX, 06;DO DAI XAU STR
LAP:      
    ;DOC TRANG THAI COM
    MOV AH, 03H
    MOV DX, 00H
    INT 14H
    AND AH, 01H ;KIEM TRA D0=1
    JZ LAP           
    
    ;DOC KY TU TU COM
    MOV AH, 02H
    MOV DX, 00H     
    INT 14H
    ;HIEN THI KY TU DOC, RA MAN HINH    
    MOV AH, 0EH
    INT 14H
    
LOOP LAP

JMP $


ret




