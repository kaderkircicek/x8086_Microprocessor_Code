; bir kelimenin polindrom olup olmadigini bulma

data segment
  kelime db 'kader'
ends 


extra segment  
    polindrommu db 1 dup(1)
    tersi db 5 dup(?)
    
ends 



stack segment
    dw   128  dup(0)
ends 



code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov ax, extra
    mov es, ax

    lea SI,kelime+4
    lea DI,tersi
    mov cx, 5
    
    dongu:
    mov al, DS:[SI]
    mov ES:[DI],al 
    inc DI
    dec SI
    loop dongu
    
    
    mov cx,5
    lea SI,kelime
    lea DI,tersi
           
    dongu2:
    jcxz bitir 
    
    mov al, DS:[SI]
    mov bl, ES:[DI]
    cmp al,bl
    JNE degistir
    inc SI
    inc DI
    loop dongu2           
       
           
    degistir:
    jcxz bitir
    mov bh,0
    mov ES:[0] ,bh
    loop dongu2
     
           
           
           
    bitir:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
