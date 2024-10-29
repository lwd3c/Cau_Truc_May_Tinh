ORG 100H

; Cac dia chi cong nhu sau:
;   A10A9A8	A7A6A5		A4A3A2        A1A0      Dia chi           Cong
;   000         011         	000	      00	60H               Cong A
;   000         011         	000	      01	61H               Cong B
;   000         011         	000	      10	62H               Cong C
;   000         011         	000	      11	63H               Thanh ghi DK

; Gia tri cua Thanh ghi DK voi dac tinh vao ra don gian Cong A vao; B va C ra nhu sau:
; D7-D6-D5-D4-D3-D2-D1-D0
; 10010000   = 90H

MOV AL, 90H
OUT 63H, AL
Loop:
IN  AL,60H                            ; Lay du lieu dua vao Cong A
OUT 61H,AL                            ; Dua ra cong B
OUT 62H,AL                            ; Dua ra cong C
JMP Loop
RET



