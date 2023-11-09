org 100h

MOV BL, 46h
MOV AL, BL
INC AX         

;AX = 47h
;BX = 46h

INC AX

;AX = 48h
;BX = 46h

MOV BX,AX
 
;AX = 48h
;BX = 48h

DEC BX
  
;AX = 48h
;BX = 47h
 
MOV AX,BX  

;AX = 47h
;BX = 47h

DEC BX

;AX = 47h
;BX = 46h