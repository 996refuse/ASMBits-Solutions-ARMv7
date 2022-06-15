//Data: .word 0x123        // Uncomment for debugging
.global _start
_start:
    bl load
    1: b 1b    // Done
load:
	ldr r0, =Data
    ldr r0, [r0]
    bx lr
	