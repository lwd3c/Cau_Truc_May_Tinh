org 100h  
  ; set mode 13
    mov ah, 0
    mov al, 13h
    int 10h
    
  ; ve hinh chu nhat  
  ; A(60, 50)
  ; B(210, 50)
  ; C(210, 150)
  ; D(60, 150) 
    mov al, 0Bh
    mov cx, 60
    mov dx, 50
    mov ah, 0ch 
    
    L1:   
        int 10h 
        inc cx
        cmp cx, 210
        jnz L1 
        
    L2:  
        int 10h 
        inc dx
        cmp dx, 150
        jnz L2
         
    L3:   
        int 10h 
        dec cx
        cmp cx, 60
        jnz L3
     
    L4:    
        int 10h 
        dec dx
        cmp dx, 50
        jnz L4   
        
ret