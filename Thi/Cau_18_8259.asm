
;19/04/2024-Xuan-BMTD/V6
org 100h  
    MOV AL,13h     ;TĐK ICW1=00010011 
    OUT 20H, AL
    MOV AL, 60h
    OUT 21H, AL
    MOV AL, 03h    ;TĐK ICW4=00000011
    OUT 21H, AL
    
    PUSH DS
    MOV AX, 00h
    MOV DS, AX 
    
    MOV SI, 4*60h
    MOV BX, offset INT60h
    MOV [SI], BX
    ADD SI, 2
    MOV BX, seg INT60h
    MOV [SI], BX
    POP DS
    
    JMP $
              
ret

INT60h:           
    PUSH AX
     
    IN AL, 60h
    OUT 61h, AL 
    
    POP AX     
IRET                  

END




