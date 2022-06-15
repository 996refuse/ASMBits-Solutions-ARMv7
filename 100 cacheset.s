.global _start
_start:
	ldr r0, =0
	ldr r1, =2
	bl cacheset
1:	b 1b    // Done

	// 0xffff000x
	// 0xffff100x
cacheset:
	eor r0, r1
    ands r0, #0xff0
    moveq r0, #1
    movne r0, #0
    bx lr
	