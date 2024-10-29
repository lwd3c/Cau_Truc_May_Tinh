org 100h
   mov ah,0     ;set video mode
   mov al,13h
   int 10h     
   
   mov ah,0Ch     ;draw line
   mov al,11	      ;white color
   mov cx,70      ;beginning col
   mov dx,70     ;row 
      
Loop_col:   
   int 10h   
   inc cx	   ;next col
   cmp cx,140     ;compare with 140
   JLE Loop_col ;yes, repeat!
   
   mov cx,70      ;beginning col
   mov dx,140     ;row   
    
Loop_col2:   
   int 10h   
   inc cx	   
   cmp cx,140     
   JLE Loop_col2 
        
   mov cx,70     
   mov dx,70     
      
Loop_row:   
   int 10h   
   inc dx	   
   cmp dx,140    
   JLE Loop_row 
      
   mov cx,140     
   mov dx,70       
     
Loop_row2:   
   int 10h   
   inc dx	   
   cmp dx,140     
   JLE Loop_row2     
  
   mov ah,4Ch   
   int 21h            
   
ret     
