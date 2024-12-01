org 100h
   ; set mode 0
   mov ah, 0  
   mov al, 0
   int 10h
     
   ; set con tro ban dau
   mov ah, 02h
   mov dl, 20
   mov dh, 12
   int 10h
   
   ; hien thi tung ki tu 
   mov bh, 0
   mov bl, 47h 
   mov cx, 1
   mov al, 31h 
L1:    
    mov ah, 09h
    int 10h
    inc al
    cmp al, 37h
    je Thoat  
    
    inc dh
    mov ah, 02h
    int 10h
    jmp L1
        
   Thoat:
        mov ah, 4ch
        int 21h
        
ret