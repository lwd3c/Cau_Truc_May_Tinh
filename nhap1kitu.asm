org 100h   
    str DB "Xin cha$"
    LEA SI, str	     	
WHILE:	
            CMP byte ptr [si], '$' 
		    JE    EXIT		
    			MOV AH, 02H	
    			MOV DL, [SI]
    			INT 21H
    			INC SI
	        JMP WHILE 
EXIT:
ret