!Somma dei primi n numeri

_EXIT = 1
_PRINTF = 127
.SECT .TEXT
start:
MOV AX,0
MOV CX,(nu)
1: ADD AX,CX
LOOP 1b
MOV (re), AX
PUSH (re)
PUSH (nu)
PUSH pr
PUSH _PRINTF
SYS
MOV SP,BP
PUSH _EXIT
SYS
.SECT .DATA
nu: .WORD 5
re: .WORD 1
pr: .ASCII "La somma dei primi %d interi e %d"
