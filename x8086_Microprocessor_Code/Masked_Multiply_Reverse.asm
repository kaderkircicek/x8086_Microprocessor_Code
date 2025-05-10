
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
mov cx,4
MOV SI,0 
MOV DI,6

dongu:
AND [sayilar1 + SI],10101010b 
AND [sayilar2 + SI],10101010b
MOV AL,[sayilar1 +SI]
MUL [sayilar2 +SI]
MOV [sonuc + DI], AX
INC SI
DEC DI
DEC DI
loop dongu


ret


sayilar1 db 0A5h, 0Ah, 07h, 09h
sayilar2 db 06h, 0Bh, 04h, 08h
sonuc dw 4 dup(?)

