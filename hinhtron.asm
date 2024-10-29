;org 100h 
;      
;.data
;    X dw 150
;    Y dw 100
;    r dw 50    
;    guess dw 10
;    result dw ?
;    
;.code 
;   main proc
;    
;   mov ah,0     ;set video mode
;   mov al,13h
;   int 10h 
;          
;          
;   call draw   
;   
;   ret
;   
;   main endp
;   
;   draw proc 
;    ; gia tri x 
;        mov cx, 0
;       
;     next_x:  
;        
;        cmp cx, [r]     ; x = cx > r -> end
;        jg end_loop                  
;        
;    ; gia tri y  
;        mov ax, [r]     ; ax = r = 50   
;        mul ax          ; ax = 2500
;        mov bx, ax      ; bx = r*r = 2500 
;        
;        mov ax, cx      ; ax = x
;        mul ax
;
;        sub bx, ax      ; bx = r*r - x*x 
;        mov dx, bx      ; dx = bx
;        call sqrt
;        
;        ; ve 4 goc phan tu 
;        mov bx, [X]
;        mov dx, [Y]
;        
;        push cx
;        push ax
;        add ax, [Y]
;        add cx, [X]
;        call point
;        pop ax
;        pop cx
;         
;        push cx
;        sub ax, [Y]
;        call point 
;        pop cx
;        
;        push ax
;        sub cx, [X]
;        add ax, [Y]
;        call point
;        pop ax
;        
;        sub ax, [Y]
;        call point 
;        
;        inc cx
;        jmp next_X
;    
;      end_loop:
;        ret
;        
;   draw endp      
;   
;   ; ham tinh can bac 2
;   sqrt proc 
;        mov si, guess
;      cal:
;        mov dx, 0
;        mov bx, si
;        div bx
;        
;        add ax, bx   ; guess = ax / guess + guess
;        shr ax, 1
;        
;        cmp ax, bx
;        je done
;        
;        mov si, ax
;        jmp cal
;      done:
;        mov result, ax
;        
;        ret
;   sqrt endp
;   
;   ; ham ve diem
;   point proc
;        
;        mov ah,0ch         
;        mov al, 12
;        mov bh, 0	      
;        int 10h 
;        ret
;   point endp
;    
;end main     

org 100h

.data
    X dw 150          ; T?a d? X c?a tâm hình tròn
    Y dw 100          ; T?a d? Y c?a tâm hình tròn
    r dw 50           ; Bán kính hình tròn
    guess dw 10       ; Giá tr? d? doán ban d?u cho can b?c 2
    result dw ?       ; K?t qu? tính can b?c 2

.code
main proc
    mov ah, 0        ; Ð?t ch? d? video
    mov al, 13h      ; 320x200 256 màu
    int 10h 

    call draw        ; G?i hàm v? hình tròn

    ret
main endp

draw proc
    mov cx, 0        ; B?t d?u t? x = 0
    mov bx, [r]      ; bx = bán kính
    mov dx, bx       ; dx = bán kính

    ; Tính toán ph?n d?u tiên c?a hình tròn
   ; call circlePoints

next_x:
    inc cx            ; Tang x
    cmp cx, bx        ; N?u x > r thì thoát
    jg end_loop

    ; Tính y d?a trên phuong trình hình tròn: y = sqrt(r^2 - x^2)
    mov ax, bx       ; ax = r
    mul ax           ; ax = r^2
    mov bx, ax       ; bx = r^2

    mov ax, cx       ; ax = x
    mul ax           ; ax = x^2
    sub bx, ax       ; bx = r^2 - x^2
    mov dx, bx       ; dx = r^2 - x^2
    call sqrt        ; Tính sqrt(r^2 - x^2), k?t qu? trong ax (y)

    ; V? 4 góc ph?n tu c?a hình tròn
    mov bx, [X]      ; bx = x tâm
    mov di, [Y]      ; di = y tâm

    ; V? di?m (X + cx, Y + ax)
    add cx, [X]
    add ax, [Y]
    call point

    ; V? di?m (X + cx, Y - ax)
    sub ax, [Y]
    call point

    ; V? di?m (X - cx, Y + ax)
    sub cx, [X]
    add ax, [Y]
    call point

    ; V? di?m (X - cx, Y - ax)
    sub ax, [Y]
    call point

    jmp next_x       ; L?p l?i

end_loop:
    ret
draw endp

; Hàm tính can b?c 2
sqrt proc
    mov si, guess
cal:
    mov dx, 0
    mov bx, si
    div bx           ; ax = dx / si

    add ax, bx       ; guess = ax / guess + guess
    shr ax, 1        ; Chia dôi

    cmp ax, bx
    je done

    mov si, ax
    jmp cal
done:
    mov result, ax   ; Luu k?t qu? vào result
    ret
sqrt endp

; Hàm v? di?m
point proc
    mov ah, 0ch      ; Ch?c nang v? di?m
    mov al, 12       ; Màu c?a di?m
    mov bh, 0        ; Trang màn hình
    int 10h          ; G?i ng?t 10h d? v? di?m
    ret
point endp

end main

