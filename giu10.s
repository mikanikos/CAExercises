.SECT .TEXT
start:
MOV BX,(n)
MOV CX,BX
1:
DEC CX
CMP CX,1
JLE 3f
MOV AX,BX
MOV DX,0
DIV CX
CMP DX,0
JE 2f
JMP 1b
2:
MOV BX,0
JMP 4f
3:
MOV BX,1
4:
PUSH BX
PUSH fmt
PUSH 127
SYS
MOV SP,BP
PUSH 0
PUSH 1
SYS
.SECT .DATA
n: .WORD 19
fmt: .ASCII "%d"
