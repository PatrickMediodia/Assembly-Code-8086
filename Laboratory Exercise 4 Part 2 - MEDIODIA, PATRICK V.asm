ORG 100h
 
 
.data

getValue DB "Enter a character : $"
showResult DB "Character Sequence Value : $"

.code

;Display get value message
MOV DX, offset getValue
CALL printString
       
       
;Get value from user
MOV AH, 01h
INT 21h
MOV CL, AL ;store AL in CL for future use
 
 
;Newline for better printing
CALL newline

  
;Display result message
MOV DX, offset showResult
CALL printString


;Print current value at CL
CALL printCharacter


;Increment from current value at CL then print: CL + 1
CALL getnextValue
                 
                 
;Increment from current value at CL then print: CL + 2
CALL getnextValue

INT 20h

;new line procedure
newline: 
    MOV AH, 02h
    MOV DL, 0Ah
    INT 21H
    
    MOV DL, 0Dh
    INT 21H   
    
    RET

    
;Increment to get next ascii value from current    
getnextValue: 
    INC CL
    CALL printCharacter
    
    RET
       
             
;Print character procedure
printCharacter:      
    MOV AH, 02h
    MOV DL, CL
    INT 21h  
    
    ;print space after character
    MOV AH, 02h
    MOV DL, 20h
    INT 21h
    
    RET
      
      
;Print string procedure
printString:  
    MOV AH, 09h
    INT 21h   
    
    RET



    



