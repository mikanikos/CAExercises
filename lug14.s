.SECT .TEXT
start:
PUSH v
CALL check
CALL sum
MOV SP,BP
PUSH AX
PUSH str
PUSH 127
SYS
MOV SP,BP
PUSH 0
PUSH 1
SYS
check:
PUSH BP
MOV BP,SP
MOV DI,4(BP)
MOV AX,0
MOV CX,-1
REPNE SCASW
ADD CX,1
NEG CX
PUSH CX
MOV SP,BP
POP BP
RET
sum:
PUSH BP
MOV BP,SP
MOV BX,4(BP)
MOV CX,6(BP)
MOV AX,0
MOV SI,0
1:
MOV DI,(BX)(SI)
CMP DI,0
JE 2f
ADD AX,DI
ADD SI,2
LOOP 1b
2:
MOV SP,BP
POP BP
RET
.SECT .DATA
v: .WORD 1,2,3,4,5,0
str: .ASCII "%d"