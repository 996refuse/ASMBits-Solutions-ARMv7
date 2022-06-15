.global _start
_start:
	ldr r0, =16384
	ldr r1, =2
	ldr r2, =0
	ldr r3, =2
	bl cachetag
1:	b 1b    // Done


cachetag:
	sub r0, #1
    clz r0, r0
    add r0, r1
    mov r1, #32
    sub r1, r0
    
    eor r2, r3
    lsrs r2, r1
    moveq r0, #1
    movne r0, #0
    bx lr
    
	
	
	