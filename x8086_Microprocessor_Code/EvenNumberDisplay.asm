
data segment  
    cumle db 'youcandothis'
    sesliharfler db 'aeiuo'

ends  

extra segment 
    yenidizi db 5 dup(?)
    sesliharfkopya db 5 dup(?)
     
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax 
    mov ax, extra
    mov es, ax

   
    lea SI, sesliharfler 
    lea DI,sesliharfkopya
    
     mov cx, 5
     
     dongu:
     movsb
     loop dongu  
     
     

    lea SI,cumle
    lea DI,sesliharfkopya
    
    mov cx,12
    
    karsilastir:
    jcxz karsilastir2
    mov al,ES:[DI] 
    mov bl,DS:[SI]
    cmp  al, bl
    je var 
    inc SI 
    loop karsilastir   
    
        
    var:
    
    lea DI, yenidizi
    mov ES:[DI],al 
    dec cx
    inc DI
    mov cx,12
    jmp karsilastir2
     
     
 
     
    karsilastir2: 
    lea SI,cumle
    lea DI,sesliharfkopya+1
    jcxz karsilastir3
    mov al,ES:[DI] 
    mov bl,DS:[SI]
    cmp  al, bl 
    loop karsilastir3 
     
    
    var2:
    
    lea DI, yenidizi+1
    mov ES:[DI],al 
    dec cx
    inc DI
    mov cx,12
    jmp karsilastir3  
    
    
    

                     
    karsilastir3:
        
    lea SI,cumle
    lea DI,sesliharfkopya+2
    
    jcxz karsilastir4
    mov al,ES:[DI] 
    mov bl,DS:[SI]
    cmp  al, bl
    je var3 
    inc SI
    loop karsilastir3                 
                     
                     
    var3:
    
    lea DI, yenidizi+2
    mov ES:[DI],al 
    dec cx
    inc DI 
    mov cx,12
    jmp karsilastir4
    

    
    
     karsilastir4:
         
    lea SI,cumle
    lea DI,sesliharfkopya+3 
   
    jcxz karsilastir5
    mov al,ES:[DI] 
    mov bl,DS:[SI]
    cmp  al, bl
    je var4
    inc SI
    loop karsilastir4
    
    
     var4:
   
    lea DI, yenidizi+3
    mov ES:[DI],al 
    dec cx
    inc DI
    mov cx,12
    jmp karsilastir5 
    

    
    karsilastir5:
    lea SI,cumle
    lea DI,sesliharfkopya+4 
    mov al,ES:[DI] 
    mov bl,DS:[SI]
    cmp  al, bl
    je var5 
    inc SI 
    loop karsilastir5
    
    
    var5:
    jcxz  bitir
    lea DI, yenidizi+4
    mov ES:[DI],al 
    dec cx
    inc DI
    jmp bitir
    
    
    
    

    bitir:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
