.SECT .TEXT
start:
MOV CX,vec2-vec1
SHR CX,1
PUSH 0
PUSH CX
PUSH vec2
PUSH vec1
CALL prodvec
ADD SP,6
POP AX
MOV SP,BP
PUSH AX
PUSH fmt
PUSH 127
SYS
MOV SP,BP
PUSH 0
PUSH 1
SYS
prodvec:
PUSH BP
MOV BP,SP
MOV CX,8(BP)
MOV SI,0
PUSH 0
1:
MOV BX,4(BP)
MOV AX,(BX)(SI)
MOV BX,6(BP)
MUL (BX)(SI)
ADD -2(BP),AX
ADD SI,2
LOOP 1b
POP 10(BP)
MOV SP,BP
POP BP
RET
.SECT .DATA
vec1: .WORD 1,2,3,4,5
vec2: .WORD 1,2,3,4,5
fmt: .ASCII "%d"
