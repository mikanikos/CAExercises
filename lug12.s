.SECT .TEXT
start:
PUSH str1
PUSH ris
CALL pal
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
pal:
PUSH BP
MOV BP,SP
MOV SI,end1
SUB SI,1
MOV CX,end1-str1
MOV DI,str2
1:
MOVSB
SUB SI,2
LOOP 1b
MOV SI,6(BP)
MOV DI,str2
MOV CX,end1-str1
REPE CMPSB
JE 2f
MOV 4(BP),0
JMP 3f
2:
MOV 4(BP),1
3:
MOV SP,BP
POP BP
RET
.SECT .DATA
ris: .WORD 0
str1: .ASCII "anna"
end1: .SPACE 1
fmt: .ASCII "%d"
end2: .SPACE 1
str2: .ASCII "."
