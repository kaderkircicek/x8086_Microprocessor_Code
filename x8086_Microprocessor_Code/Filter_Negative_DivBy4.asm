
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV CX,4
MOV SI,0 
MOV DI,0

dongu:
MOV BX,0
MOV AX,0 
MOV AX,[sayilar+SI]
MOV BX,4 
CWD
IDIV BX 
CMP DX,0
JE negatifmi 
INC SI
INC SI
JCXZ bitir
loop dongu 
 
JMP bitir
  
  
negatifmi: 
MOV BX,0
CMP BX, [sayilar + SI]
JNL arttir
INC SI
INC SI
DEC CX
JMP dongu
 

arttir:
MOV AX, [sayilar + SI]
MOV [sayilar2 + SI], AX
INC DI
INC SI
INC SI
JCXZ bitir
DEC CX
JMP dongu




bitir:
ret

ret 

sayilar dw -12,-36,28,-17 
sayilar2 dw 4 dup (?)




