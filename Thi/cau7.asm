org 100h 
    ; in ra thong bao
    mov ah, 9
    lea dx, tb
    int 21h
         
    lea si, arr
    L1:
        ; doc ki tu tu ban phim
        mov ah, 0
        int 16h         ; ki tu luu o al
        
        ; neu la ki tu enter thi in mang ra man hinh
        cmp al, 0Dh
        je print
        
        ; hien thi ra man hinh
        mov ah, 0Eh
        int 10h 
        
        ; luu vao mang A        
        mov [si], al
        inc si
        jmp L1

    ; hien thi mang A ra man hinh  
    
    print:
        mov ah, 9
        lea dx, tb2
        int 21h
        
        lea si, arr  
        mov ah, 0Eh
        L2:     
            cmp [si], 0
            jz thoat
            mov al, [si]  
            int 10h
            inc si
            jmp L2
    thoat:
        mov ah, 4ch
        int 21h    

    tb db "Nhap vao ky tu: $" 
    tb2 db 0Dh, 0Ah, "Chuoi ky tu nhap vao la: $" 
    arr db 50 DUP(0)
    
ret
