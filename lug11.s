.SECT TEXT
start:
PUSH n
CALL lun
MOV SP,BP
PUSH CX
PUSH fmt
PUSH 127
SYS
MOV SP,BP
PUSH n
CALL com
MOV SP,BP
PUSH 0
PUSH 1
SYS
lun:
PUSH BP
MOV BP,SP
MOV BX,4(BP)
MOV SI,0
MOV CX,0
MOV AX,(end)
1:
CMP AX,(BX)(SI)
JE 2f
INC CX
ADD SI,2
JMP 1b
2:
MOV SP,BP
POP BP
RET
com:
PUSH BP
MOV BP,SP
MOV SI,4(BP)
MOV AX,CX
MOV DI,m
REP MOVSW
MOV CX,AX
MOV BX,m
MOV SI,0
1:
CMP (BX)(SI),0
JE 2f
MOV (BX)(SI),0
JMP 3f
2:
MOV (BX)(SI),1
3:
ADD SI,2
LOOP 1b
MOV SP,BP
POP BP
RET
.SECT DATA
n: .WORD 1,0,0,1
end: .WORD 5
m: .WORD 0
fmt: .ASCII "%d"