org 100h

.data



.code
            
                      
;JMP EXAMPLES
        
             
    ;GET INPUT
       
        ;label: MOV AH,01h
        ;       MOV DL, 41h
        ;       INT 21h
        
                
        ;       JMP label            
                     
                 
             
    ;PRINT A
       
        ;label: MOV AH,02h
        ;       MOV DL, 41h
        ;       INT 21h
        
                
        ;       JMP label
                       
                      
              
    
    ;PRINT 1 -> end
    
        ;MOV BL, 31h
        
        ;label: MOV AH,02h
        ;       MOV DL, BL
        ;       INC BL
        ;       INT 21h
        
                
        ;       JMP label      
        
        
        
; LOOPING
;   - uses CX as a counter for how many times to loop
;   - in this example, we are looping 5 times
        
    ;MOV CX, 05
        
    ;label: MOV AH, 02h
    ;       MOV DL, 41h
    ;       INT 21h
           
    ;       LOOP label 

