org 100h
mov ax,3  ; text mode 80x25, 16 colors, 8 pages (ah=0, al=3)
int 10h  
     
mov     ax, 0b800h ; set segment register:
mov     ds, ax  

mov ax,0EC41h
push ax
mov ax,0EC42h
push ax
pop [02h] 
pop [00h] 
ret
