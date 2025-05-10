org 100h 

mov cx, 5 
mov SI,0

kaydet:
mov ah,01h 
int 21h
mov [ sayilar + SI],al
inc SI
loop kaydet  

mov cx, 5
mov SI,0 
mov bl,3
 
bolme:
mov al,[sayilar+ SI]
cbw
div bl
mov [kalan + SI],ah
inc SI
loop bolme   


mov ah,02h
mov dh,10
mov dl,10
int 10h

mov cx, 5
mov SI,0 

yazdirma:
PUSH CX 

mov al,[kalan + SI] 
cmp SI,0
je beyaz

mov bl, 11100000b
mov bh,0
mov cx,1 
mov ah,09h
int 10h
inc SI
jmp son 

beyaz:
mov bl, 11110000b
mov bh,0
mov cx,1 
mov ah,09h
int 10h
inc SI

son: 
mov ah,02h
inc dh
inc dl
int 10h
pop CX
loop yazdirma


ret
sayilar db 5 dup(?)
kalan db 5 dup(?)

    
    
