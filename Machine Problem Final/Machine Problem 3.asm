org 100h

.data
    inputStringPrompt db "Enter Characters: $"
    inputKeyPrompt db "Enter Character to Search: $"
    foundMessage db "Character Found!$"
    notFoundMessage db "Character Not Found!$"


.code
    inputString:
        MOV AH, 09h
        MOV DX, offset inputStringPrompt    
        INT 21h                             ; display prompt for user to input string
        
        MOV BX, 200h                        ; start of input is at 200h
        inputCharacter:
            MOV AH, 01h
            INT 21h                         ; input a character
                    
            MOV [BX], AL                    ; move pointer to next memory location
            INC BX      
            
            CMP AL, "@"                     ; if user does not input the terminal character
            JNE inputCharacter              ; input character again 
            
         CALL newLine
    
    inputKey:
        MOV AH, 09h
        MOV DX, offset inputKeyPrompt
        INT 21h                             ; prompt the user the input the key
               
        MOV AH, 01h
        INT 21h                             ; let the user input the keu
        
        key db ""
        MOV key, AL                         ; store the key to the variable key
        
        CALL newLine
    
        
    searchKey:
        MOV BX, 200h                        ; point BX to start of input
        searchCharacter:
            MOV AL, [BX]                    ; get the current character in the input string
            
            CMP AL, key                     
            JE found                        ; go to found when the key is found
            
            CMP AL, "@"
            JE notFound                     ; go to not found when BX reaches the terminal character
            
            INC BX
            JMP searchCharacter             ; loop
    
        found:
            MOV AH, 09h
            MOV DX, offset foundMessage      
            INT 21h                         ; display the message when found
            JMP exit                        ; go to end of program
        
        notFound:
            MOV AH, 09h
            MOV DX, offset notFoundMessage
            INT 21h
            JMP exit                        ; display the message when not found
                                            ; go to end of program
    
    exit:
        INT 20h                             ; exit the program
    
    
    newLine:                            ; display new line function
        MOV AH, 02h                     
        MOV DL, 0Ah
        INT 21h                         ; display line feed
        MOV DL, 0Dh 
        INT 21h                         ; display carriage return
        RET
