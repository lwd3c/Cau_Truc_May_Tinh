.model small

.stack 100h

.data
    str DB 100 dup'$'                       ; khoi tao str
    tb1 DB 'Nhap vao chuoi: $'   
    tb2 DB 13,10,'Chuoi vua nhap la: $'
    tb3 DB 13,10,'Chuoi in thuong la: $'    ; 10 xuong dong
    tb4 DB 13,10,'Chuoi in hoa la: $'       ; 13 lui dau dong  

.code
   main proc 
    
        mov ax, @data       ; khoi tao ds
        mov ds, ax
        
        ; in thong bao va nhap chuoi
        lea dx, tb1         ; in tb1
        mov ah, 9
        int 21h
        
        lea dx, str         ; nhap 1 chuoi
        mov ah, 10
        int 21h
        
        ; in chuoi vua nhap
        lea dx, tb2         ; in tb2
        mov ah, 9           
        int 21h
        
        lea dx, str+2       ; in chuoi vua nhap
        mov ah, 9
        int 21h 
               
        ;in chuoi thuong
        lea dx, tb3         ; in tb3
        mov ah, 9
        int 21h  
        call normal         ; goi ham normal
        
        ;in chuoi hoa
        lea dx, tb4         ; in tb4
        mov ah, 9
        int 21h
        call upper          ; goi ham upper
    
        mov ah, 4ch
        int 21h      
               
   main endp  
         
         
   normal proc  
    
        lea si, str+2       ; gan dia chi chuoi vao si
       
        Loop1:
            mov dl, [si]    ; sao chep gia tri cua si vao dl
            cmp dl, 'A'     ; so sanh dl voi A
            jl jump1        ; neu nho hon A (khong phai chu hoa), nhay toi jump1
            cmp dl, 'Z'     ; so sanh dl voi Z
            jg jump1        ; neu lon hon Z (khong phai chu hoa), nhay toi jump1
            add dl, 32       ;chuyen ki tu hoa thanh thuong
        jump1:
            mov ah, 2       ; in 1 ki tu ra man hinh
            int 21h
            inc si          ; tang si 1 gia tri de tro toi ki tu tiep theo
            cmp [si], '$'   ; so sanh gia tri cua si voi $
            jne Loop1       ; neu khac $, nhay toi Loop1
        ret
            
   normal endp
           
           
   upper proc 
    
        lea si, str+2    
        Loop2:
            mov dl, [si]           
            cmp dl, 'a'      ; so sanh voi a, neu nho hon nhay toi jump2
            jl jump2
            cmp dl, 'z'      ; so sanh voi z, neu lon hon nhay toi jump2
            jg jump2
            sub dl, 32       ; chuyen ki tu hoa thanh thuong
        jump2:              
            mov ah, 2        ; in 1 ki tu ra man hinh
            int 21h
            inc si           ; tang si 1 gia tri
            cmp [si], '$'
            jne Loop2
        ret
        
   upper endp
            
   
end