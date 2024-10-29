org 100h
    PUSH DS
    MOV AX, 00H
    MOV DS, AX   

    MOV SI, 4*50h
    MOV BX, offset INT50h
    MOV [SI], BX
    ADD SI, 2
    MOV BX, seg INT50h
    MOV [SI], BX
    POP DS

    MOV AH, 09h
    LEA DX, STR
    INT 50h
INT 20h          
ret     	    

STR db "Cau truc may tinh#"

INT50h:       
    PUSH SI
    PUSH AX 
    MOV SI, DX
    CMP AH, 09h    
    JNZ Thoat
LAP:    
    MOV AH, 0Eh
    MOV AL, [si]
    INT 10h 
    INC SI
    CMP [SI],'#'
    JNZ LAP
	Thoat: 
    POP AX
    POP SI
IRET                  

END
