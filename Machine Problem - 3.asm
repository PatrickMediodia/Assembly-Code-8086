    org 100h

.data 

    enterPrompt db "Enter characters: $"

    enterSearchPrompt db "Enter character to search: $"
    
    foundPrompt db "Character Found! $"
    
    notFoundPrompt db "Character Not Found! $"     
    
.code

    showStartMessage:
        MOV BX, 200H     ; start address at 200H
            
        MOV DX, offset enterPrompt
        CALL printMessage
    
    getInput: 
        MOV AH, 01H
        INT 21H
        MOV [BX], AL
        INC BX
        CMP AL, 40H     ; check if user has inputted @    
        JNE getInput
        
    CALL newLine    
    MOV DX, offset enterSearchPrompt
    CALL printMessage
            
    MOV AH, 01H         ; get value from user
    INT 21H         
            
    loopThroughInput:
        DEC BX 
        CMP [BX], AL
        JE correctMessage 
        
        CMP BX, 1FFH             
        JE wrongMessage
        JNE loopThroughInput
                  
    correctMessage:
        CALL newLine
        MOV DX, offset foundPrompt
        CALL printMessage
        
        INT 20H
       
    wrongMessage:
        CALL newLine
        MOV DX, offset notFoundPrompt
        CALL printMessage
        
        INT 20H
                    
    newLine:          
        MOV AH, 02h
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        RET       
 
    printMessage:  
        MOV AH, 09h
        INT 21h   
        
        RET