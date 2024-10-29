org 100h

; set text mode   
        
    mov ah, 0
    mov al, 03h
    int 10h
    
    mov al, 1
    mov bh, 0
    mov bl, 01001110b
    mov cx, 12
    mov dl, 20
    mov dh, 10
    push cs
    pop es
    mov bp, offset msg
    mov ah, 13h
    int 10h
    
    msg db "Le Huynh Duc"

ret                  

