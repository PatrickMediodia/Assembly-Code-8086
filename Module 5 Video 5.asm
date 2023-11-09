org 100h

.data

msg DB "Enter a character: $"
msg2 DB "You have entered: $"


.code

;print message 1   
MOV AH,09h
MOV DX,offset msg    
INT 21h

;input reqest, input will be stored in al
MOV AH,01h
int 21h 
;presureve AL by moving it to CL
MOV CL,AL
             
CALL newline

;print message 2              
MOV AH,09h
MOV DX,offset msg2    
int 21h


;print message stored in CL
MOV AH,02h
MOV DL,CL
int 21h

int 20h

;new line procedure
newline: 

MOV AH, 02h
MOV DL, 0Ah
INT 21H

MOV DL, 0Dh
INT 21H   

RET    




;MOV AH,09h - OUTPUT
;MOV AH,01h - INPUT
;MOV AH,09h - GET FROM LOWER BIT
