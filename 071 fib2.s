.global _start
_start:
    mov r0, #4
    bl fib
    1: b 1b

.global fib
fib:
	mov r1, #1
    mov r2, #0
    
loop:
    cmp r0, #0
    beq exit1
    sub r0, #1
	
    adds r2, r1
    bhs exit0

    cmp r0, #0
    beq exit2
    sub r0, #1
    
    adds r1, r2
    bhs exit0
    
    b loop
    
exit0:
	mov r0, #0
    bx lr
exit1:
	mov r0, r1
    bx lr
exit2:
	mov r0, r2
    bx lr	
