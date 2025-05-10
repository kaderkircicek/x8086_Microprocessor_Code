
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV CX,4 
MOV SI,0
MOV DI,0
LEA BX, sayilar


dongu: 
mov AX,[BX +SI]
and AX , 1111b
mov dl,al 
mov [sayilar2 + DI ],dl
INC SI
INC SI 
INC DI
loop dongu



ret

sayilar dw 10,20,30,40
sayilar2 db 4 dup(?)


