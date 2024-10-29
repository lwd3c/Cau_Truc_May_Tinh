org 100h

; set video mode
mov ah, 0
mov al, 13h
int 10h      

mov al, 11      ; mau
mov ah, 0ch   

; hinh chu nhat 

    ; canh 1
    
    mov cx, 50      
    mov dx, 50
    L1:
        int 10h
        inc dx
        cmp dx, 100
        jnz L1
       
    ; canh 2
    mov cx, 50      
    mov dx, 50    
    L2:
        int 10h
        inc cx
        cmp cx, 150
        jnz L2
    
    ; canh 3
    mov cx, 150      
    mov dx, 50
    L3:
        int 10h
        inc dx
        cmp dx, 100
        jnz L3 
    
    ; canh 4
    mov cx, 50      
    mov dx, 100
    L4:
        int 10h
        inc cx
        cmp cx, 150
        jnz L4
   
ret
               
             