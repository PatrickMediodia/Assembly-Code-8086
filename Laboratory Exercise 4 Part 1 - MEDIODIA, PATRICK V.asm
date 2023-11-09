ORG 100h
           
;set instruction to print character             
MOV AH, 02h             
             
;Print first name

    ;Print P           
    MOV DL, 50h 
    INT 21h   
             
             
    ;Print a           
    MOV DL, 61h 
    INT 21h
 
    
    ;Print t           
    MOV DL, 74h 
    INT 21h
          
                 
    ;Print r           
    MOV DL, 72h 
    INT 21h
    
    
    ;Print i           
    MOV DL, 69h 
    INT 21h
    
    
    ;Print c           
    MOV DL, 63h 
    INT 21h
    
    ;Print k           
    MOV DL, 6bh 
    INT 21h
                
                
                 
;Print middle initial

    ;Print space           
    MOV DL, 20h 
    INT 21h
    
    
    ;Print V           
    MOV DL, 56h 
    INT 21h
    
    
    ;Print .           
    MOV DL, 2Eh 
    INT 21h
    
    
    ;Print space           
    MOV DL, 20h 
    INT 21h
                 
       
;Print last name

    ;Print M           
    MOV DL, 4Dh 
    INT 21h
    
    
    ;Print e           
    MOV DL, 65h 
    INT 21h
    
    
    ;Print d           
    MOV DL, 64h 
    INT 21h
                 
                 
    ;Print i           
    MOV DL, 69h 
    INT 21h
     
     
    ;Print o           
    MOV DL, 6fh 
    INT 21h
    
    
    ;Print d           
    MOV DL, 64h 
    INT 21h
    
    ;Print i           
    MOV DL, 69h 
    INT 21h
    
    ;Print a           
    MOV DL, 61h 
    INT 21h

  
;terminate program
INT 20h