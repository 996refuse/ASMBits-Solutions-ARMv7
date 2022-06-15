.global _start
_start:
	ldr r0, =12	// 12 address lines
	ldr r1, =8	// 8 data lines
	bl memsize
1:	b 1b    // Done

memsize:
	lsl r0, r1, r0
    bx lr
