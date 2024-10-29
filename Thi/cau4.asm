org 100h
    ; set mode 03
    mov ah, 0
    mov al, 03h
    int 10h
    
    ; hien thi chuoi ki tu
    mov al, 1    
    mov bh, 0
    mov bl, 0E4h  
    mov cx, 1           ; hien thi 1 ki tu
    mov dl, 30
    mov dh, 12
    push cs
    pop es
    lea bp, msg
    
    L1:  
        cmp [bp], ' '
        jz newline
        mov ah, 13h
        int 10h 
        inc bp 
        inc dl
        cmp [bp], '$'
        jz thoat
        jmp L1
        
     newline: 
        inc bp
        inc dh
        mov dl, 30
        jmp L1 
        
     thoat:
        mov ah, 4ch
        int 21h
  
    msg db "CAU TRUC MAY TINH$" 
    
ret
