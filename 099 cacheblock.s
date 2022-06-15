.global _start
_start:
	ldr r0, =0
	ldr r1, =2
	bl cacheblock
1:	b 1b    // Done

cacheblock:
	eor r0, r1
	lsrs r0, #4
    movne r0, #0
    moveq r0, #1
    bx lr
	