org 100h
    ; COM1, b = 9600 baud, p = N, d = 8, s = 1
    
    ; khoi tao cong COM
    mov ah, 0
    mov dx, 0            ; COM1
    mov al, 0F3h
    int 14h
   
    ; doc trang thai cong COM       
check_empty:
    mov ah, 3
    mov dx, 0
    int 14h   
        
    ; kiem tra bit D6
    test ah, 40h
    jz check_empty
    
    lea si, msg
    
    mov al, [si]
    cmp al, '$'
    je end_proc
    
    mov ah, 1
    int 14h
    inc si
    jmp check_empty 
    
    end_proc:
    
    msg db "Hello!$"
   
ret