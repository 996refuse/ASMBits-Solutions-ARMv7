.global _start
_start:
	ldr r0, =4
	ldr r1, =2
	bl mask
1:	b 1b    // Done

mask:
	mov r2, #1
    mov r2, r2, LSL r0
    sub r2, #1
	mov r2, r2, LSR r1
    mov r0, r2, LSL r1
    bx lr
	