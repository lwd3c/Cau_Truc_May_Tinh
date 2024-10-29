org 100h       
Xau1   DB     "Khoa KTDK HVKTQS$"
Xau2   DB      18 Dup ('') 
mov ax, @data      
mov ds, ax
lea dx, Xau1
mov ah, 9
int 21h
Lea          SI, Xau1
Lea          DI, Xau2
Mov        Cx, 18
Lap_Copy:
	Mov        Al, [SI]
	Mov        [DI], Al
	Inc           SI
	Inc           DI
Loop    Lap_Copy
        
        
lea dx, Xau2
mov ah, 9
int 21h  


ret