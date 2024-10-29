org 100h
    ; set mode 02
    mov ah, 0
    mov al, 02h
    int 10h
    
    ; dat vi tri hien thi
    mov dl, 12
    mov dh, 5
    mov bh, 0
    mov ah, 02h
    int 10h
    
    ;hien thi cuoi 
     lea si, msg
    L1:      
        cmp [si], '$'
        jz thoat
        mov al, [si]
        mov ah, 0Eh
        int 10h 
        
        inc si
        inc dl
        inc dh   
        mov ah, 02h
        int 10h
        jmp L1
    
    thoat:
        mov ah, 4ch
        int 21h
  
    msg db "HOCVIENKTQS$" 
    
ret
