org 100h 


.data
    
enterPrompt db "Enter password: $"

endPrompt db "Program Terminated Normally$"
     
     
.code    
    declarePassword: 
        MOV [200H], 31h
        MOV [201H], 32h
        MOV [202H], 33h

    showEnterPromt:
                                     
        MOV DX, offset enterPrompt
        CALL printMessage      
                           
    MOV BX, 300H
                          
    getInput:
        MOV AH, 01H
        INT 21H
        MOV [BX], AL
        INC BX
        CMP BX, 303H      
        JNE getInput
          
     
    MOV BX, [300H]
    MOV CX, [200H]
                   
    checkPassword:
        CMP BX, CX
        CALL newLine        
        JNE showEnterPromt 
        INC BX
        INC CX  
    
    MOV DX, offset endPrompt
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