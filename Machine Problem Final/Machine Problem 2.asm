
org 100h


.data
    inputPrompt db "Enter Password: $"
    exitMessage db "Program Terminated Normally$"
    inputLength dw 3


.code
    declarePassword:
        MOV 200h, "1"                   ; start of declared password is at 200h                  
        MOV 201h, "2"                   ; set memory location to each letter
        MOV 202h, "3"
 
    inputPassword:
        MOV AH, 09h
        MOV DX, offset inputPrompt
        INT 21h                         ; display input prompt
        
        MOV BX, 204h                    ; Start of Input is at 204h
        MOV CX, inputLength
        inputCharacter:
            MOV AH, 01h
            INT 21h
            MOV [BX], AL                ; store current input to memory
            
            INC BX
            LOOP inputCharacter
        CALL newLine       
     
    checkPassword:
        MOV CX, inputLength
        checkCharacter:                 ; get the values in the current memory addresses
            MOV BX, 200h-1              ; of input and the declared
            ADD BX, CX                  
            MOV AH, [BX]
             
            MOV BX, 204h-1              
            ADD BX, CX
            MOV AL, [BX]                
            
            CMP AL, AH                  
            JNE inputPassword           ; input password again if one of the characters is not equal
            
            LOOP checkCharacter         ; check each character
 
    exit:
        MOV AH, 09h
        MOV DX, offset exitMessage
        INT 21h                         ; display exit message
        
        INT 20h                         ; end program
    
    
    newLine:                            ; display new line function
        MOV AH, 02h                     
        MOV DL, 0Ah
        INT 21h                         ; display line feed
        MOV DL, 0Dh 
        INT 21h                         ; display carriage return
        RET
        
        
    
    
    
    
    
    



