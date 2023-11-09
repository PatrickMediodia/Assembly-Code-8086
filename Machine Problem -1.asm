org 100h


.data

    inputPrompt db "Enter characters: $"

    reversePrompt db "Reversed: $"

    repeatPrompt db "Would you like to enter again? Press 1 if yes otherwise press any key: $"

    finalMessage db "Program Terminated Normally $"


.code

    showStartMessage:
        MOV BX, 200H     ; start address at 200H
            
        MOV DX, offset inputPrompt
        CALL printMessage    
    
    getInput: 
        MOV AH, 01H
        INT 21H
        MOV [BX], AL
        INC BX
        CMP BX, 210H     ; check if user has inputted 10 characters    
        JNE getInput
        
    CALL newLine
       
    MOV DX, offset reversePrompt
    CALL printMessage
          
    reverseInput:
        MOV AH, 02H
        MOV DL, [BX]
        INT 21h
        DEC BX 
        CMP BX, 1FFH
        JNE reverseInput
                 
    CALL newLine
       
    MOV DX, offset repeatPrompt   
    CALL printMessage 
              
    repeatProcess:
        MOV AH, 01H
        INT 21H
        CMP AL, 31H
        
        CALL newLine        
        JE showStartMessage
        
    MOV DX, offset finalMessage   
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
        
            
    
    


