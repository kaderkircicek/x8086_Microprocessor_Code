; multi-segment executable file template.

data segment
  kelime db 'youcandothis'
  sesliharf db 'aeiuo' 
  yenidizi db 5 dup(?)
ends  

extra segment 
  sesliharfkpy db 5 dup(?)
  
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
    
    mov cx,5 
    
    LEA SI,sesliharf
    LEA DI, sesliharfkpy 
    
    dongu1:
    movsb
    loop dongu1
   
        
    LEA SI,kelime
    LEA DI, sesliharfkpy 
    lea Bx,yenidizi
     
    mov cx, 5
     
    dongu:
    mov al,DS:[SI]
    scasb
    loopne dongu 
    JCXZ  sonharfkontrol
    jmp yazdir 
    
    sonharfkontrol:
    LEA DI, sesliharfkpy+5
    scasb
    je yazdir
    jne yeniharf
     
    yazdir: 
    mov DS:[Bx],al
    inc bl
    yeniharf:
    inc SI 
    mov cx,5
    LEA DI, sesliharfkpy
    jmp dongu
    

    
    
    
    bitir:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
