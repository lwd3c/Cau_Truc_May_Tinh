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
    
   lea si, arr   
   L1:      
       cmp [si], 0
       jz Thoat 
       mov cx, 1
       mov al, [si] 
       mov ah, 09h
       int 10h 
       
       ; set con tro moi
       inc si
       inc dh 
       ;inc dl      ; hien thi theo duong cheo
       mov ah, 02h
       int 10h
       jmp L1
    
   Thoat:
        mov ah, 4ch
        int 21h
        
   arr db 31h, 32h, 33h, 34h, 35h, 0

ret