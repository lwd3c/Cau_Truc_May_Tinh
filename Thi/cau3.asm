org 100h  
  ; set mode 13
    mov ah, 0
    mov al, 13h
    int 10h
    
  ; ve duong gap khuc
  ; A(50, 300)
  ; B(150, 300)
  ; C(50, 100)
  ; D(50, 50) 
    mov al, 0Bh
    mov cx, 50
    mov dx, 300
    mov ah, 0ch 
  
    ; ve AB
    L1:
        int 10h 
        inc cx
        cmp cx, 150
        jnz L1
    
    ; ve BC
    L2:
        int 10h
        dec cx
        sub dx, 2
        cmp cx, 50
        jnz L2
        
    ; ve CD
    L3:   
        int 10h 
        dec dx
        cmp dx, 50
        jnz L3 
    
    mov ah, 4ch
    int 21h
    
ret