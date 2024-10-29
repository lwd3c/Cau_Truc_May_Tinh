org 100h
    ; set mode 02h
    mov ah, 0
    mov al, 02h
    int 10h
    
    ; hien thi chuoi ki tu
    mov al, 1    
    mov bh, 0
    mov bl, 04Eh  
    mov cx, 1           ; hien thi 1 ki tu
    mov dl, 15
    mov dh, 6
    push cs
    pop es
    lea bp, msg
    
    L1:  
        mov ah, 13h
        int 10h 
        inc bp 
        inc dl
        inc dh 
        cmp [bp], '$'
        jz thoat
        jmp L1
          
     thoat:
        mov ah, 4ch
        int 21h
  
    msg db "HOCVIENKTQS$" 
    
ret
