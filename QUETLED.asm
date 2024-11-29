
; Quet 4 led 7 thanh
PA      EQU 60h
PB      EQU 61h
PC      EQU 62h
TGDK    EQU 63h 
; PA CONG DU LIEU NOI CAC THANH A,B,C...G,H
; PB.0 DK LED 1, PB.1 DK LED 2, PB.2 DK LED 3, PB.3 DK LED 4
org 100h 
    
    MOV AL,89h      ;PA,PB-OUT, PC-IN    
    OUT TGDK,AL      
    
    ;HIEN THI SO 1234 RA LED
    MOV LED1,2
    MOV LED2,9
    MOV LED3,0
    MOV LED4,6
    MOV BH,00H     
    
start:
    ; XUAT DU LIEU TRONG BIEN LED1 RA LED 1
    MOV BL,LED1
    MOV AL,code_seg[BX] ;LAY MA 7 THANH LED1, BX: chi so mang          
    OUT PA,AL       ;SUAT DU LIEU RA CONG DU LIEU              
    MOV AL,01H      ;CHO LED1 SANG         
    OUT PB,AL  
    mov cx,50h     ;DELAY
    loop $
    MOV AL,00H
    OUT PB,AL       ;TAT HET CAC LED
      
    ; XUAT DU LIEU TRONG BIEN LED2 RA LED 2
    MOV BL,LED2
    MOV AL,code_seg1[BX];LAY MA 7 THANH LED2          
    OUT PA,AL       ;SUAT DU LIEU RA CONG DU LIEU              
    MOV AL,02H      ;CHO LED2 SANG         
    OUT PB,AL  
    mov cx,50h     ;DELAY
    loop $
    MOV AL,00H
    OUT PB,AL       ;TAT HET CAC LED 
     
    ; XUAT DU LIEU TRONG BIEN LED3 RA LED 3
    MOV BL,LED3
    MOV AL,code_seg[BX];LAY MA 7 THANH LED3          
    OUT PA,AL       ;SUAT DU LIEU RA CONG DU LIEU              
    MOV AL,04H      ;CHO LED3 SANG         
    OUT PB,AL  
    mov cx,500h     ;DELAY
    loop $
    MOV AL,00H
    OUT PB,AL       ;TAT HET CAC LED    
    
    ; XUAT DU LIEU TRONG BIEN LED4 RA LED 4
    MOV BL,LED4
    MOV AL,code_seg[BX];LAY MA 7 THANH LED4          
    OUT PA,AL       ;SUAT DU LIEU RA CONG DU LIEU              
    MOV AL,08H      ;CHO LED4 SANG         
    OUT PB,AL  
    mov cx,500h     ;DELAY
    loop $
    MOV AL,00H
    OUT PB,AL       ;TAT HET CAC LED
    
JMP start  
RET
;KHAI BAO CAC BIEN
    LED1 DB 0
    LED2 DB 0
    LED3 DB 0
    LED4 DB 0
    code_seg  db 0c0h,0f9h,0a4h,0b0h,099h,092h,082h,0f8h,080h,090h
    code_seg1 db 040h,079h,024h,030h,019h,012h,002h,078h,000h,010h,0FFh,0FFh
END




