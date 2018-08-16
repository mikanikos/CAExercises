! Stampa la somma di un vettore di interi
_EXIT = 1
_PRINTF = 127
.SECT .TEXT
start:
MOV CX,end-vec
SHR CX,1 ! In CX va la lunghezza del vettore
MOV BX,vec
MOV SI,0
MOV AX,0
1: ADD AX,(BX)(SI)
ADD SI,2
LOOP 1b
PUSH AX
PUSH format
PUSH _PRINTF
SYS
MOV SP,BP
PUSH 0
PUSH _EXIT
SYS
.SECT .DATA
vec: .WORD 3,4,7,11,3
end: .SPACE 1
format: .ASCII "La somma degli elementi del vettore e %d"
