.global _start
_start:
	ldr r0, =63	// Depth 16
	ldr r1, =31	// 8 bit wide (128 bits of capacity)
	bl addrlines
1:	b 1b    // Done

addrlines:
    sub r0, #1
    clz r0, r0
    mov r1, #32
    sub r0, r1, r0
    bx lr
	
	