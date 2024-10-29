; THANH GHI THU/PHAT: 3F8H
; TG HE SO CHIA DLAB=1: 3F8H,3F9H
; TG DK DUONG: 3FBH
; TG TRANG THAI DUONG: 3FDH

org 100h

    MOV AL,80H		; DLAB =1.
  	MOV DX,3FBH 	; THANH GHI DK DUONG
  	OUT DX,AL      	; D7 = 1 cho DLAB
                        
  	MOV AX,48   	; toc do truyen = 2400
  	MOV DX,3F8H  	; (LSB)
  	OUT DX,AL       
  	MOV AL,AH
  	MOV DX,3F9H     ; (MSB)
  	OUT DX,AL       	
    
    ; Cai tham so cho truyen
    MOV AL, 03 	;1 stop, khong chan le, 8 bit data
	MOV DX, 3FBH
	OUT DX, AL

    LEA SI,MSG	;cho SI cho vao chuoi
B1: 
    MOV DX, 3FDH	
    IN AL, DX
    TEST AL,01000000B ;kiem tra bit D6 = 0 dang truyen, D6=1 truyen xong va dua du lieu vao tiep 
    JZ B1
    MOV AL,[SI]
    CMP AL,"$" 
    JE B2             ;Gap $ ket thuc truyen
    MOV DX, 3F8H
    OUT DX,AL       ;Gui du lieu ra thanh ghi dl de truyen di
    INC SI               	
    JMP B1                
B2:	 
    MOV DX, 3FDH  
    IN AL,DX        ;Doc thanh ghi trang thai DUONG
    TEST AL,00000001B ;kiem tra bit D0 de nhan
    JZ B2   
    MOV DX, 3F8H
    IN AL,DX        ;DOC KY TU NHAN DUOC
    MOV BL,AL
B3: 	  
    MOV DX, 3FDH
    IN AL,DX        ;Doc thanh ghi trang thai
    TEST AL,01000000B ;kiem tra bit D6 de truyen tiep
    JZ B3   
    MOV AL,BL
    MOV DX, 3F8H      
    OUT DX,AL

    JMP B2 
    MSG DB  "Hay go mot ky tu bat ky:",0dh,0ah,'$'

ret




