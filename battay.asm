org 100h       

.data
    MY_DATA DB "Chao ban. Ban co khoe khong?", CR, LF
            DB "Cam on. Toi khoe. Con ban the nao?", CR, LF, "$"
    PA EQU 60H
    PB EQU 61H
    PC EQU 62H
    CWP EQU 63H
    LF EQU 0AH
    CR EQU 0DH

.code
    MOV AL, 80h
    MOV DX, CWP
    OUT DX, AL 
    
    MOV AL, 00001101b
    OUT DX, AL
    MOV SI, OFFSET MY_DATA
 AGAIN:
    MOV AL, [SI]
    CMP AL, "$"
    JZ OVER  
    
    MOV DX, PC
 BACK:
    IN AL, DX
    AND AL, 08
    JZ BACK 
    
    ;MOV DX, PA
;    MOV AL, AH 
    mov dx, PB
    
    OUT DX, AL 
    
    INC SI
    JMP AGAIN
 OVER:
    mov ah, 4ch
    int 21h 