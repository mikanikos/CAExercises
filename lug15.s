.SECT .TEXT
start:
PUSH d
PUSH c
PUSH b
PUSH a
CALL max
CALL crea
MOV SP,BP
PUSH 0
PUSH 1
SYS
max:
PUSH BP
MOV BP,SP
MOV BX,4(BP)
MOV DX,(BX)
MOV SI,0
MOV CX,4
1:
MOV AX,(BX)(SI)
CMP DX,AX
JG 2f
MOV DX,AX
2:
ADD SI,2
LOOP 1b
MOV SP,BP
POP BP
RET
crea:
PUSH BP
MOV BP,SP
MOV DI,v
MOV SI,4(BP)
MOV CX,4
REP MOVSW
MOV SP,BP
POP BP
RET
.SECT .DATA
a: .WORD 12
b: .WORD 2
c: .WORD 33
d: .WORD 25
v: .WORD 0,0,0,0