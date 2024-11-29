
;19/04/2024-Xuan-BMTD/V6
org 100h

;CAI TOC DO TRUYEN 4800bps
;DLAB =1
    MOV DX, 3FBH
    MOV AL, 80H
    OUT DX, AL

    MOV AX, 24  ;4800bps
    MOV DX, 3F8H
    OUT DX, AL  ;LSB 

    MOV AL, AH
    MOV DX, 3F9H
    OUT DX, AL  ;MSB

    MOV DX, 3FBH
    MOV AL, 03H ;N,8,1
    OUT DX, AL
    
    ;XOA BIT D0 CUA 3FD
    MOV DX, 3FDH
    IN  AL, DX
    AND AL, 0FEH
    OUT DX, AL
    
    LEA SI, BUFFER ;SI TRO BO DEM BUFFER    
    MOV CX, 6   ;DO DAI XAU NHAN: HELLO! 
   
    ;KIEM TRA DU LIEU DEN DA CO
LAP:
    MOV DX, 3FDH
    IN  AL, DX
    AND AL, 01H ;BIT D0=1?
JZ LAP     
    ;DOC KY TU NHAN TU 8250  
    MOV DX, 3F8H    
    IN  AL, DX
    MOV [SI], AL
    INC SI
LOOP LAP 
 
    ;TRUYEN TRA LAI XAU NHAN
    LEA SI, BUFFER ;SI TRO BUFFER!    
    MOV CX, 6   ;DO DAI XAU DA NHAN
LAP1:
    MOV DX, 3FDH
    IN  AL, DX
    AND AL, 40H ;BIT D6=1?
JZ LAP1     
    ;GHI KY TU RA 8250  
    MOV DX, 3F8H
    MOV AL, [SI]
    OUT DX, AL
    INC SI
LOOP LAP1  

    JMP $

    BUFFER DB 100 DUP(?)

END




