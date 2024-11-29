
;19/04/2024-Xuan-BMTD/V6
org 100h

;CAI TOC DO TRUYEN 2400bps
;DLAB =1
    MOV DX, 3FBH
    MOV AL, 80H
    OUT DX, AL

    MOV AX, 48  ;2400bps
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
    
    ;KIEM TRA DA NHAN DUOC KY TU
LAP:
    MOV DX, 3FDH
    IN AL, DX
    AND AL, 01H ;BIT D0=1?
JZ LAP 
    ;DOC KY TU TU 8250
    MOV DX, 3F8H
    IN  AL, DX                   
    MOV KYTU, AL; LUU LAI KY TU NHAN DUOC
    
    ;GHI KY TU RA 8250 
    ;KIEM TRA THANH GHI PHAT RONG
LAP1:
    MOV DX, 3FDH
    IN  AL, DX
    AND AL, 40H ;BIT D6=1?
JZ LAP1 
     
    MOV DX, 3F8H
    MOV AL, KYTU    
    OUT DX, AL    
JMP LAP 

    KYTU DB 0
END




