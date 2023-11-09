org 100h

.data


.code

MOV BX, 200h

L1: MOV AH, 01h
    INT 21h
    MOV [BX], AL
    INC BX
    CMP BX, 205h
    JNE L1
    
    ;new line
    MOV [BX], 24h
    
    MOV AH, 02h
    MOV DL, 0Dh
    INT 21h
    MOV DL, 0Ah
    INT 21h
    
SUB BX, 01h     ; subtract 1 from 200 (Note: This is in hex)

L2: MOV AH, 02h
    MOV DL, [BX]
    INT 21h
    DEC BX 
    CMP BX, 1FFh
    JNE L2
    
    INT 20h
    

; Only use BX
    ; BX is a base register (INDEX)(Reference for memory address)
    ; CX is a counter register
    ; DX is an ouput register
    
 
    