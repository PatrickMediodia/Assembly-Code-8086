org 100h
 
 
.data

msg db "do not enter 1$"
msg2 db "why you enter 1$"       
 
       
.code
  
; JMP - jump to an address (Very limited)
; JNE - Jump if not equal
; JE - Jump if equal
; CMP - compare values from registers 
  

MOV AH, 09h
MOV DX, offset msg
INT 21h
 
label: MOV AH, 01h
       INT 21h
       CMP AL,31h  
       JNE label
          
       MOV AH, 09h
       MOV DX, offset msg2
       INT 21h 
       INT 20h



; STOP WHEN INPUT IS NOT 1
 
;label: MOV AH, 01h
;       INT 21h
;       CMP AL,31h  
;       JNE label
;       INT 20h 
 
 
       
; STOP WHEN INPUT IS 1
 
;label: MOV AH, 01h
;       INT 21h
;       CMP AL,31h  
;       JNE label
;       INT 20h