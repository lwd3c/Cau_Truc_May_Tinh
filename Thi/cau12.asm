org 100h
    ; COM1, b = 9600 baud, p = N, d = 8, s = 1
    
    ; khoi tao cong COM
    mov ah, 0
    mov dx, 0       ; COM1
    mov al, 11100011b
    int 14h
   
    ; doc trang thai cong COM
    mov ah, 3
    mov dx, 1
    mov ah, 
        
        
   
   
   
   
   
    msg db "Hello!"
   
ret