org 100h

; set video mode
mov ah, 0
mov al, 13h
int 10h      

mov al, 11      ; mau
mov ah, 0ch   

; hinh binh hanh 

    ; canh 2
    mov cx, 75      
    mov dx, 50    
    L2:
        int 10h
        inc cx 
        cmp cx, 175
        jnz L2
               
               
    ; canh 4
    mov cx, 50      
    mov dx, 100
    L4:
        int 10h
        inc cx
        cmp cx, 150
        jnz L4
    
    ; canh 1
    mov cx, 50      
    mov dx, 100
    L1:
        int 10h
        inc cx
        sub dx, 2
        cmp dx, 50
        jnz L1
    
    ; canh 3
    mov cx, 150      
    mov dx, 100
    L3:
        int 10h
        sub dx, 2
        inc cx
        cmp dx, 50
        jnz L3 
           
ret
               
             