.global _start
_start:
    mov r0, #2
    bl fib
    1: b 1b

.global fib
fib:
    push {lr, r1-r3}

	movs r3, r0, lsr #1
    beq exit0
    
    sub r2, r0, #2
    sub r1, r0, #1

	mov r0, r1
	bl fib
    mov r1, r0
    
    mov r0, r2
    bl fib
    mov r2, r0
    
    add r0, r1, r2
    
    pop {lr, r1-r3}
    bx lr
exit0:
	mov r0, #1
    pop {lr, r1-r3}
    bx lr
	