
; verilen sayi dizisinde sayilarin  mutlak degeri mutlak dizisine aktarilmali. 
; mutlak dizisindeki sayilar ciftse iki kati, tekse kendisi sonuc dizisine aktarilmali



org 100h  

MOV CX,6
MOV DI,0
MOV SI,0 
MOV BH,-1 
mov bl,2


dongu:
jcxz  dongu2
MOV AL,[sayilar+DI]
cmp AL,0
JL mutlakal 
Mov [mutlak+DI],al 
inc DI
loop dongu



mutlakal: 
jcxz  dongu2
IMUL bh
mov [mutlak+DI], al
inc DI
loop dongu

    
dongu2:
mov cx,6
jmp tekmi


    
tekmi:
jcxz bitir
mov bh,1
mov al,[mutlak +SI] 
div bl
cmp ah,bh
jb ikikatbul 
mov al,[mutlak +SI]
mov [sonuc+SI],al
inc SI
loop tekmi




ikikatbul:
jcxz bitir
mov al,[mutlak +SI]
mul bl
mov [sonuc+SI], al
inc SI
loop tekmi
 


bitir:
ret

sayilar db -2,-4,5,6,-12,9  
mutlak db 6 dup(?)
sonuc db 6 dup(?)


