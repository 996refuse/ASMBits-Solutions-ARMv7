.global _start
_start:
	ldr r0, =8
	ldr r1, =4
	ldr r2, =0
	ldr r3, =2
	bl cacheset
1:	b 1b    // Done

cacheset:
	eor r2, r2, r3
	lsr r2, r1
    mov r3, #32
    sub r0, r3, r0
    lsl r2, r0
    
    cmp r2, #0
    moveq r0, #1
    movne r0, #0
    
    bx lr
	