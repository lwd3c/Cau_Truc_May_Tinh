org 100h
    ; hien thi thong bao
    lea dx, tb
    mov ah, 09h
    int 21h
    
    L1:
        ; doc du lieu tu ban phim
        mov ah, 1
        int 21h         ; ki tu luu o al
        
        ; kiem tra ki tu nhap vao  
        cmp al, 1Bh          ; ESC
        je Thoat
        cmp al, 'b'
        je Batloa
        cmp al, 't'
        je Tatloa
        jmp L1
    
    ; bat loa   
    Batloa:   
        in al, 61h
        or al, 03h          ; dat 2 bit cuoi la 1
        out 61h, al
        jmp L1
    
    ; tat loa
    Tatloa:     
        in al, 61h
        and al, 0FCh        ; xoa 2 bit cuoi
        out 61h, al   
        jmp L1 

    Thoat:
        mov ah, 4ch
        int 21h

    tb db "Nhan b de bat loa, nhan t de tat loa: $"

ret
