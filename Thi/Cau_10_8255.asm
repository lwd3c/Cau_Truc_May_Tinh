

;19/04/2024-Xuan-BMTD/V6
PA   EQU 60h
PB   EQU 61h
PC   EQU 62h
TGDK EQU 63H
org 100h

    MOV AL, 91H
    OUT TGDK, AL;PA-IN,PB-OUT,PCL-IN,PCU-OUT
LAP:
    IN AL, PA
    AND AL, 01H ;KIEM TRA K0      
    JNZ NEXT1
        MOV AL, 55H
        OUT PB, AL    
    NEXT1:
    
    IN AL, PA
    AND AL, 02H ;KIEM TRA K1
    JNZ NEXT2
       MOV AL, 0AAH     
       OUT PB, AL            
    NEXT2:
    
    IN AL, PA
    AND AL, 04H ;KIEM TRA K2
    JNZ NEXT3
       MOV AL, 00H     
       OUT PB, AL            
    NEXT3:        
            
    ;DOC PCL GHI RA PCU
    IN AL,  PC
    MOV CL, 4
    SHL AL, CL        
    OUT PC, AL    
JMP LAP    

ret




