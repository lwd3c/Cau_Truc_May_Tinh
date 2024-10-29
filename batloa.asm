org 100h
BD0     EQU 40H
BD1     EQU 41H
BD2     EQU 42H
TGDK    EQU 43H   
;Tu dieu khien: 10.11.011.0=B6H


MOV AL, 0B6H     ; bo dem 2  	
OUT TGDK,AL   	
MOV AX, 65000     ; HE SO CHIA 	
OUT BD2,AL   	
MOV AL,AH   	
OUT BD2,AL 
JMP $  
    
ret
