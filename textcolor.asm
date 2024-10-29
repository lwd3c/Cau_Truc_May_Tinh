org 100h
   mov ah,0             ;set text mode
   mov al,3
   int 10h     
   
   mov ah,6             ;scroll up windows
   mov cx,081Ah         ;upper left conner
   mov dx,1034h         ;lower right conner
   mov bh, 7eh    ;char and background
   mov al,0
   int 10h 
     
   mov ah,2             ;move cusor
   mov dx,0C27h         ;centre of screen
   xor bh,bh            ;page of screen 
   int 10h	

   mov ah,13h           ;display char
   mov bh,0             ;page 0
   mov bl, 7eh    
   mov cx,12            ;1 char
   mov dx,0c21h
   push cs
   pop es
   mov bp, offset msg1
   int 10h
   
   mov ah,4Ch           ;set up to
   int 21h              ;return to DOS 
         
   msg1 db "LE HUYNH DUC"      
ret
               

