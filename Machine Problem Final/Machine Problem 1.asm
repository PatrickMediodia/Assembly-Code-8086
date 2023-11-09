org 100h


.data
    inputPrompt db "Enter Characters: $"
    outputMessage db "Reversed: $"
    loopPrompt db "Would you like to enter again? Press 1 if yes otherwise press any key: $"
    exitMessage db "Program Terminated Normally$"
 
 
.code
    inputWord:
        MOV AH, 09h
        MOV DX, offset inputPrompt      ; Display Input Prompt
        INT 21h
            
        MOV BX, 200h
        MOV CX, 10                      ; input character
        inputCharacters:
            MOV AH, 01h                 ; input character
            INT 21h
            
            MOV [BX], AL                ; store character to memory
            INC BX                      ; move BX to next position
            LOOP inputCharacters
        
              
        CALL newLine      
        
     
    outputReversedWord:       
        MOV AH, 09h
        MOV DX, offset outputMessage    ; Display Output Message
        INT 21h
    
        DEC BX
        MOV CX, 10                      ; initialize loop
        outputCharacters:
            MOV DL, [BX]
            MOV AH, 02h
            INT 21h                     ; display character    
            
            DEC BX
            LOOP outputCharacters
        
        
        CALL newLine         
         
    promptLoop:      
        MOV AH, 09h
        MOV DX, offset loopPrompt
        INT 21h                         ; ask if the user wants to loop
        
        MOV AH, 01h
        INT 21h
        CMP AL, '1'                     ; loop if user did not press 1 
        CALL newLine
        JE inputWord
        
        
    exit:
        MOV AH, 09h
        MOV DX, offset exitMessage
        INT 21h                         ; show exit message        
              
        INT 20h
        
    
    
    newLine:
        MOV AH, 02h
        MOV DL, 0Ah
        INT 21h
        MOV DL, 0Dh
        INT 21h
        ret