org 100h 
mov cx,7
mov SI,0  

mov ah,02h ; imlecin yerini belirledik
mov dl,5
mov dh,5
int 10h

kullanicidanal:
mov ah,00h
int 16h
sub al,30h
mov [sayilar + SI], al
inc SI
loop kullanicidanal


mov cx,7
mov SI,0


tekmiciftmi:
PUSH CX 
JCXZ bitir

mov bl,[sayilar + SI]
mov al,[sayilar + SI]
cbw
idiv sayi
cmp ah,0
je ciftse
JCXZ bitir


mov ah,02h;imlecin yerini ayarladik
inc dl
int 10h
 
mov al,bl
add al,30h
mov ah,09h ;ekrana yazdirdik
mov cx,1 
mov bl,11110100b
mov bh,0
int 10h

 
inc SI
JCXZ bitir
POP CX
loop tekmiciftmi


ciftse:
JCXZ bitir
mov ah,02h;imlecin yerini ayarladik
inc dh
int 10h 

mov al,bl
add al,30h
mov ah,09h ;ekrana yazdirdik
mov cx,1
mov bl,11110100b
mov bh,0
int 10h

inc SI
JCXZ bitir
POP CX
loop tekmiciftmi



bitir:
ret
sayilar db 7 dup(?)
sayi db 2


