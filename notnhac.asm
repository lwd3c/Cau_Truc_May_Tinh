org 100h
BD0     EQU 40H
BD1     EQU 41H
BD2     EQU 42H
TGDK    EQU 43H
; Tu dieu khien: 10.11.011.0=B6H

MOV AL, 0B6H        ; Bo dem 2
OUT TGDK, AL        ; G?i giá tr? di?u khi?n t?i c?ng TGDK

CALL PLAY_NOTES     ; G?i hàm phát nh?c

JMP $               ; Vòng l?p vô h?n

ret

;=====================================
; Ham phat tat ca cac not nhac
PLAY_NOTES:
    ; Phat not C4
    MOV AX, 4560    ; T?n s? n?t C4 (261.63 Hz)
    CALL PLAY_NOTE
    
;    ; Phat not D4
;    MOV AX, 4061    ; T?n s? n?t D4 (293.66 Hz)
;    CALL PLAY_NOTE
;    
;    ; Phat not E4
;    MOV AX, 3621    ; T?n s? n?t E4 (329.63 Hz)
;    CALL PLAY_NOTE
;    
;    ; Phat not F4
;    MOV AX, 3418    ; T?n s? n?t F4 (349.23 Hz)
;    CALL PLAY_NOTE
;    
;    ; Phat not G4
;    MOV AX, 3048    ; T?n s? n?t G4 (392.00 Hz)
;    CALL PLAY_NOTE
;    
;    ; Phat not A4
;    MOV AX, 2712    ; T?n s? n?t A4 (440.00 Hz)
;    CALL PLAY_NOTE
;    
;    ; Phat not B4
;    MOV AX, 2417    ; T?n s? n?t B4 (493.88 Hz)
;    CALL PLAY_NOTE
    
    RET

;=====================================
; Ham phat mot not nhac
PLAY_NOTE:
    OUT BD2, AL     ; G?i ph?n th?p c?a AX
    MOV AL, AH      ; L?y ph?n cao c?a AX
    OUT BD2, AL     ; G?i ph?n cao c?a AX
    
    CALL DELAY      ; T?o d? tr? d? nghe âm thanh
    RET

;=====================================
; Ham delay (tao do tre)
DELAY:
    MOV CX, 0FFFFH  ; Giá tr? l?n d? t?o d? tr?
DELAY_LOOP:
    LOOP DELAY_LOOP ; Gi?m CX, n?u CX != 0 thì ti?p t?c vòng l?p
    RET
