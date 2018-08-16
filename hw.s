! Esercizio homework 7
        _EXIT = 1
	_PRINTF = 127
.SECT .TEXT
start:
        PUSH 0
	PUSH s
	CALL LUN
	ADD SP,2
        PUSH 0
        PUSH s
	PUSH (c)
	CALL OCC
        ADD SP,4
	PUSH f
	PUSH _PRINTF
	SYS
        MOV SP,BP
	PUSH 0
	PUSH _EXIT
	SYS
LUN:
	PUSH BP
	MOV BP,SP
	MOV DI,4(BP)
        PUSH 0
        MOV AX,0
	MOV CX,-1
	REPNE SCASB
	INC CX
        NOT CX
        MOV -2(BP),CX
        POP 6(BP)
	MOV SP,BP
	POP BP
	RET
OCC:
	PUSH BP
	MOV BP,SP
        MOV DX,4(BP)
	MOV BX,6(BP)
        PUSH 0
	MOV AX,0
	DEC BX
1:	INC BX
	MOV CX,(BX)
	CMPB DL,CL
	JNE 2f
	INC AX
2:	CMPB CL,0
	JNE 1b		
        MOV -2(BP),AX
        POP 8(BP)
	MOV SP,BP
	POP BP
	RET
.SECT .DATA
s: .ASCIZ "homework"
c: .ASCII "o"
f: .ASCII "Occorrenze di c in s: %d Lunghezza di s: %d"
