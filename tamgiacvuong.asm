org 100h

; set video mode
mov ah, 0
mov al, 13h
int 10h

; tam giac vuong 

    ; canh 1
    mov al, 11      ; mau
    mov cx, 50      
    mov dx, 50
    mov ah, 0ch
    
    L1:
        int 10h
        inc dx
        cmp dx, 150
        jnz L1
       
    ; canh 2
    mov al, 11      ; mau
    mov cx, 50      
    mov dx, 150
    mov ah, 0ch
    
    L2:
        int 10h
        inc cx
        cmp cx, 101
        jnz L2
    
    ; canh huyen
    mov al, 11      ; mau
    mov cx, 50      
    mov dx, 50
    mov ah, 0ch
    
    L3:
        int 10h
        inc cx
        add dx, 2
        cmp dx, 150
        jnz L3
   
ret
               
             