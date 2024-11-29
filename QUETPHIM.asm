; 8255 THU NHAT CS NOI IO3
PA      EQU 60h
PB      EQU 61h
PC      EQU 62h
TGDK    EQU 63h 

; 8255 THU NHAT
; PA NOI CONG DU LIEU LED
; PB.0->PB.3 DK LED1->LED4
; PB.4->PB.7 NOI CAC HANG1->HANG4 BAN PHIM
; PC.0->PC.3 NOI CAC COT1->COT4 BAN PHIM
data segment
    ;KHAI BAO CAC BIEN
    LED1 DB 0
    LED2 DB 0
    LED3 DB 0
    LED4 DB 0 
    MAPHIM DB 0
    code_seg  db 0c0h,0f9h,0a4h,0b0h,099h,092h,082h,0f8h,080h,090h,0FFh,0FFh
    code_seg1 db 040h,079h,024h,030h,019h,012h,002h,078h,000h,010h,0FFh,0FFh
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:     
    MOV AX, data
    MOV DS, AX
    MOV ES, AX
    ; KHOI TAO 8255 THU NHAT
    MOV AL,89h      ;PA,PB-OUT, PC-IN    
    OUT TGDK,AL     
    
    ;KHOI TAO SO BAN DAU CHO LED
    MOV LED1,0
    MOV LED2,0
    MOV LED3,0
    MOV LED4,0         
BEGIN: 
    
    CALL QUET_PHIM
    
    MOV AL, MAPHIM
    MOV AH,0H  
    
    MOV BL,10
    DIV BL  ; CHIA AX CHO BL; AL=PHAN NGUYEN, AH=PHAN DU
    MOV LED4,AH
    
    MOV AH,0H
    DIV BL
    MOV LED3,AH
    
    MOV LED2,10 ; MA TAT LED
    MOV LED1,10 ; MA TAT LED
      
    CALL QUETLED    
JMP BEGIN  
;------------------------------------------------------
QUET_PHIM:
    ;cho cac hang = 0 (PB.4->PB.7 = 0)
    MOV MAPHIM, 0    
    MOV AL,0H
    OUT PB,AL  
    ; doc cot
    IN  AL, PC
    AND AL, 0FH; LAY 4 BIT THAP PC.0->PC.3
    CMP AL, 0FH
    JNE TIMPHIM
        MOV MAPHIM, 0 ; KHONG CO PHIM NHAN GAN =0    
        JMP KTQUETPHIM
TIMPHIM:      
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;CHO HANG 1 = 0 PB.4=0
    MOV AL, 0E0H
    OUT PB, AL
    ;DOC CAC COT PC0->PC3
    IN AL, PC
    MOV BL,0
    CALL QUETCOT       
    CMP MAPHIM, 0
    JNZ KTQUETPHIM 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    
    ;CHO HANG 2 = 0 PB.5=0
    MOV AL, 0D0H
    OUT PB, AL
    ;DOC CAC COT PC0->PC3
    IN AL, PC 
    MOV BL,4
    CALL QUETCOT       
    CMP MAPHIM, 0
    JNZ KTQUETPHIM
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    
    ;CHO HANG 3 = 0 PB.6=0
    MOV AL, 0B0H
    OUT PB, AL
    ;DOC CAC COT PC0->PC3
    IN AL, PC 
    MOV BL,8
    CALL QUETCOT       
    CMP MAPHIM, 0
    JNZ KTQUETPHIM
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;CHO HANG 4 = 0 PB.7=0
    MOV AL, 70H
    OUT PB, AL
    ;DOC CAC COT PC0->PC3
    IN AL, PC 
    MOV BL,12
    CALL QUETCOT 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       
KTQUETPHIM:
RET                                           
;------------------------------------------------------
;AL GIA TRI DOC TU CAC COT
;BL MA PHIM BAT DAU CHO HANG  
QUETCOT:
    ; KIEM TRA COT 1
    TEST AL, 01H  ;neu AL=01 thi nhay den B1
    JNE B1
        MOV MAPHIM,1
        ADD MAPHIM, BL
        JMP BN
    B1:        
    ; KIEM TRA COT 2
    TEST AL, 02H
    JNE B2
        MOV MAPHIM,2
        ADD MAPHIM, BL
        JMP BN
    B2: 
    ; KIEM TRA COT 3
    TEST AL, 04H
    JNE B3
        MOV MAPHIM,3
        ADD MAPHIM, BL
        JMP BN
    B3:
    ; KIEM TRA COT 4
    TEST AL, 08H
    JNE B4
        MOV MAPHIM,4
        ADD MAPHIM, BL
        JMP BN
    B4: 
    MOV MAPHIM, 0
    BN: 
RET     
;-----------------------------------------------------
QUETLED:    
    ; Quet 4 led 7 thanh
    ; XUAT DU LIEU TRONG BIEN LED1 RA LED 1 
    MOV BH,00H    
    MOV BL,LED1
    MOV AL,code_seg[BX];LAY MA 7 THANH LED1          
    OUT PA,AL       ;SUAT DU LIEU RA CONG DU LIEU              
    MOV AL,01H      ;CHO LED1 SANG         
    OUT PB,AL  
    mov cx,500h     ;DELAY
    loop $
    MOV AL,00H
    OUT PB,AL       ;TAT HET CAC LED
      
    ; XUAT DU LIEU TRONG BIEN LED2 RA LED 2
    MOV BL,LED2
    MOV AL,code_seg[BX];LAY MA 7 THANH LED2          
    OUT PA,AL       ;SUAT DU LIEU RA CONG DU LIEU              
    MOV AL,02H      ;CHO LED2 SANG         
    OUT PB,AL  
    mov cx,500h     ;DELAY
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
RET
    
    
ends

end start ; set entry point and stop the assembler.
