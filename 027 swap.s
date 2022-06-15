Data: .word 0x123, 0x124, 0x125
.global _start
_start:
    ldr r0, =Data
    ldr r1, =0
    ldr r2, =2
    bl swap
    1: b 1b    // Done

// Swap two array elements
swap:
	push {r4}
	ldr r3, [r0, r1, LSL #2]
	ldr r4, [r0, r2, LSL #2]
    str r4, [r0, r1, LSL #2]
	str r3, [r0, r2, LSL #2]
	pop {r4}
	bx lr
	