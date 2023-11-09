ORG 100h

;Print first name

    ;Print P           
    MOV AH, 50h
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print a           
    MOV AH, 61h
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print t           
    MOV AH, 74h
    MOV CL, AH
    
    CALL printLetter
                 
                 
    ;Print r           
    MOV AH, 72h
    MOV CL, AH
    
    CALL printLetter
     
     
    ;Print i           
    MOV AH, 69h
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print c           
    MOV AH, 63h
    MOV CL, AH
    
    CALL printLetter
    
    ;Print k           
    MOV AH, 6bh
    MOV CL, AH
    
    CALL printLetter
    
             
             
;Print middle initial

    ;Print space           
    MOV AH, 20h
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print V           
    MOV AH, 56h
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print .           
    MOV AH, 2Eh
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print space           
    MOV AH, 20h
    MOV CL, AH
    
    CALL printLetter
                 
       
                
;Print last name

    ;Print M           
    MOV AH, 4dh
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print e           
    MOV AH, 65h
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print d           
    MOV AH, 64h
    MOV CL, AH
    
    CALL printLetter
                 
                 
    ;Print i           
    MOV AH, 69h
    MOV CL, AH
    
    CALL printLetter
     
     
    ;Print o           
    MOV AH, 6fh
    MOV CL, AH
    
    CALL printLetter
    
    
    ;Print d           
    MOV AH, 64h
    MOV CL, AH
    
    CALL printLetter
    
    ;Print i           
    MOV AH, 69h
    MOV CL, AH
    
    CALL printLetter
    
    ;Print a           
    MOV AH, 61h
    MOV CL, AH
    
    CALL printLetter

  
  
;terminate program
INT 20h
           
           
;Print Letter procedure
printLetter:           
    MOV AH, 02h
    MOV DL, CL
    INT 21h

    RET
