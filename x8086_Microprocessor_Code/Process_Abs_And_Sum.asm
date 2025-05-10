
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov cx,6
mov SI,0 
mov bh,0 
mov bl, -1 
mov dh,2

dongu:
mov dl,[sayilar+ SI]
cmp [sayilar+ SI], bh
jl mutlakal 
mov al,[sayilar+ SI] 
mov [mutlak + SI],al
div dh
cmp bh, ah
je sonucf 
mov dl,[mutlak+ SI]
mov [sonuc + SI],dl 
INC SI
jcxz bitir
loop dongu  

MOV SI,0
mov cx,6
 
dongu2:
mov ax,0
mov al,[sonuc + SI]
add [toplam], ax
INC SI 
loop dongu2

jmp bitir


mutlakal:

mov al,[sayilar + SI] 
imul bl
mov [ mutlak + SI], al
mov al, [ mutlak + SI] 
div dh
cmp bh, ah
je sonucf 
mov al, [ mutlak + SI] 
mov [sonuc + SI],al 
dec cx 
jcxz bitir 
inc SI
jmp dongu


sonucf: 
mov al,[mutlak + SI]
mul dh
mov [sonuc + SI],al 
dec cx 
jcxz bitir
inc SI
jmp dongu 


bitir:
ret


sayilar db -12,23,34,-9,-6,43 
mutlak db 6 dup(?)
sonuc  db 6 dup(?) 
toplam dw 0




