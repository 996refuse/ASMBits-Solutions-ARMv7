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
    
    mov r1, #32
    sub r1, r0   // 24
    
    lsls r3, r2, r1
    bne exit0
    lsrs r3, r2, r0
    beq exit0
    mov r0, #1
    bx lr
    
exit0:
	mov r0, #0
    bx lr
	