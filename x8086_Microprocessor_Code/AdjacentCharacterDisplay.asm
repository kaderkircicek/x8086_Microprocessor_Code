org 100h 

mov cx,5
mov SI, 0
 
dongu: 

mov AH, 01h; kullanicidan alip dizide sakladik 
int 21h 
mov  [dizi + SI], al
inc SI
loop dongu
                        
            
mov ah,02h ; imlecin pozisyonunu ayarladik
mov dh,10
mov dl,5
int 10h  

mov cx, sayac-offset dizi
mov SI,0


dongu2:
PUSH CX


mov al, [dizi+SI]; ekrana yazdirma
mov bh,0
mov bl,00000011b
mov cx,3
mov ah,09H 
int 10h 

cmp al, [dizi+SI+1]
je yanyana  

inc SI  
mov ah, 02h ;imlec pozisyon ayarlama
inc dh
mov dl,5
int 10h
JCXZ bitir 
POP CX       
loop dongu2

yanyana:
inc SI  
mov ah, 02h ;imlec pozisyon ayarlama
inc dl
inc dl
inc dl
int 10h 
JCXZ bitir 
POP CX
loop dongu2 


bitir:
ret  


dizi db 5 dup(?)
sayac db 0