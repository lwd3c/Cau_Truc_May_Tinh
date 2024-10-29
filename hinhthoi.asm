org 100h

; set video mode
mov ah, 0
mov al, 13h
int 10h      

mov al, 11      ; mau
mov ah, 0ch   

; hinh thoi 

    ; canh 1
    mov cx, 50     
    mov dx, 100
    L1:
        int 10h
        add cx, 2
        dec dx
        cmp dx, 49 
        jnz L1
        
    ; canh 2
    mov cx, 50     
    mov dx, 100
    L2:
        int 10h
        add cx, 2
        inc dx
        cmp dx, 150 
        jnz L2

    ; canh 3
    mov cx, 150     
    mov dx, 150
    L3:
        int 10h
        add cx, 2
        dec dx
        cmp dx, 100 
        jnz L3

    ; canh 4
    mov cx, 250     
    mov dx, 100
    L4:
        int 10h
        sub cx, 2
        dec dx
        cmp dx, 50 
        jnz L4     
ret
               
             