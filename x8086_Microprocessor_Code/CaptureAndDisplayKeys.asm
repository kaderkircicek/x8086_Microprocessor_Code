org 100h 

mov cx,5
mov SI, 0
 
dongu:
mov AH, 00h 
int 16h 
mov  [dizi + SI], al
inc SI
loop dongu
                        
            
mov ah,02h 
mov dh,10
mov dl,5
int 10h  

mov cx,5
mov SI,0


dongu2:
PUSH CX



mov ah,03h ; imlec pozisyon okuma   
int 10h  

mov al, [dizi+SI]; ekrana yazdirma
mov bh,0
mov ah,0AH 
mov cx,3
int 10h 

mov ah, 02h ;imlec pozisyon ayarlama
inc dl
int 10h
 
inc SI
mov ah, 02h ;imlec pozisyon ayarlama
inc dH
int 10h

POP CX
loop dongu2
ret  


dizi db 5 dup(?)
sayac db 3 dup(?)
    
    
