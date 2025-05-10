
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
MOV CX ,14
MOv SI,0

dongu:
CMP [cumle +SI],'e'
JE esittir
INC SI
JCXZ bitir
loop dongu


esittir: 
INC SI
CMP [cumle + SI],'r'
JE arttir
DEC CX
JCXZ bitir
JMP dongu


arttir:
INC esayisi
DEC CX 
JCXZ bitir
JMP dongu

bitir:
ret

ret
cumle db 'mikroislemciler'
esayisi db 0



