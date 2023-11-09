org 100h

.data

.code


; AX, BX, CX, DX registers are very limitng


MOV BX, 200h            ; BX = 200h

L1: MOV AH, 01h        ; get input
    INT 21h            ; grant request
     
    MOV [BX], AL       ; move value of AL to 200h
                       ; [] brackets mean that we are not putting it in BX literally only in the address found in BX                                                                               
                       ; [200] = AL 
                        
    INC BX             ; 200 to 201
     
    CMP BX, 203h       ; compares if BX value is 203h
    JNE L1             ; if BX values is not 203h continue
                       ; stores values in address : 200, 201, 202
                        
        
    MOV [203H], 24h    ; put $ in address 203h
                       ; will be used in printing later
                        
    ;print single value
       
    ;MOV AH, 02h       ; request for output
    ;MOV DL, [201h]    ; use DL for printing, [] means get value in that address 
    ;INT 21h
    ;INT 20h
    
    
    MOV AH, 09h        ; request to print 
    MOV DX, 200h       ; no need for offset because 200h is an address
    INT 21h            ; it will stop because $ denotes the end of the string
    INT 20h
     
     
     