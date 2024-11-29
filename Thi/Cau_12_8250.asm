
;19/04/2024-Xuan-BMTD/V6
org 100h

    MOV AH, 00H
    MOV DX, 00H ;COM1
    MOV AL, 0E3H;9600,N,8,1
    INT 14H    

    LEA SI, STR

    MOV CX, 06;DO DAI XAU STR
LAP:      
    ;DOC TRANG THAI COM
    MOV AH, 03H
    MOV DX, 00H
    INT 14H
    AND AH, 40H ;KIEM TRA D6=1
    JZ LAP           
    
    ;GHI KY TU RA COM
    MOV AH, 01H
    MOV DX, 00H
    MOV AL, [SI]; 
    INT 14H    
    INC SI
LOOP LAP

JMP $

STR DB "HELLO!"
ret




