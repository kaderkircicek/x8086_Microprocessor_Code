
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov SI,0
mov cx,4 
lea DI,sayilar2 + 3


dongu:

mov al, [sayilar + SI]
INC al
mov [DI], al
mov al, 0 
dec DI
INC SI
loop dongu
 
  

ret
 
sayilar db 2,4,6,3 
sayilar2 db 4 dup(?)


