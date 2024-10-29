.model small

.stack 100

.data
    tb1 DB 'Nhap vao 1 ki tu: $'
    tb2 DB 13,10,'Ki tu vua nhap la: $'
    tb3 DB 13,10,'Ki tu sau khi chuyen sang ki tu hoa la: $'
    upper DB ?
    normal DB ?

.code
   main proc
        mov ax, @data   ; khoi tao ds (data segment)
        mov ds, ax      ; dua ds toi dau doan data
        
        lea dx, tb1     ; in tb1 ra man hinh
        mov ah, 9
        int 21h
        
        mov ah, 1       ; nhap 1 ki tu tu ban phim, luu vao al
        int 21h
        
        mov normal, al    ; sao chep gia tri al vao char
        
        lea dx, tb2     ; in tb2 ra man hinh
        mov ah, 9
        int 21h
        
        mov dl, normal    ; sao chep gia tri char vao dx
        mov ah, 2       ; in 1 ki tu ra man hinh
        int 21h
        
        sub al, 20h     ; doi thanh ki tu hoa
        mov upper, al    ; sao chep vao char
        
        lea dx, tb3     ; in tb3 ra man hinh
        mov ah, 9
        int 21h
        
        
        mov dl, upper    ; sao chep vao dl
        mov ah, 2       ; in 1 ki tu
        int 21h
        
        
        mov ah, 4ch
        int 21h
        
   main endp
end