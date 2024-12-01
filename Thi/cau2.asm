org 100h  
  ; set mode 13
    mov ah, 0
    mov al, 13h
    int 10h
    
  ; ve tam giac vuong  
  ; A(80, 60)
  ; B(80, 150)
  ; C(260, 60) 
    mov al, 0Bh
    mov cx, 80
    mov dx, 60
    mov ah, 0ch 
    
;    L1:     
;        int 10h 
;        inc cx
;        cmp cx, 260
;        jnz L1 
;        
;        mov cx, 80
;    L2:  
;        int 10h 
;        inc dx
;        cmp dx, 150
;        jnz L2
;         
;    L3: 
;        int 10h   
;        add cx, 2
;        dec dx
;        cmp dx, 60
;        jnz L3   
        
       L1:     
        int 10h 
        inc cx
        cmp cx, 260
        jne L1 
        
    L2:  
        int 10h
        sub cx, 2 
        inc dx
        cmp dx, 150
        jne L2
         
    L3: 
        int 10h   
        dec dx
        cmp dx, 60
        jne L3
        
        mov ah, 4ch
        int 21h

ret