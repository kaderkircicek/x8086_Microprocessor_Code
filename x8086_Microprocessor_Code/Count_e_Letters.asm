
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
MOV CX ,12
MOv SI,0

dongu:
CMP [cumle +SI],'e'
JE esittir 
INC SI
JCXZ bitir
loop dongu



esittir:
INC esayisi
dec cx
inc SI 
jmp dongu



bitir:
ret

ret
cumle db 'kelime eleme'
esayisi db 0



