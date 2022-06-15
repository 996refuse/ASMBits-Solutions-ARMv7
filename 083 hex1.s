
// A test case to test your function with
.global _start
_start:
    ldr r0, =0xa    // First parameter is always in r0
    bl hex1
    b _start        // End of testing code

map:
.string "0123456789abcdef"
// Print one hex digit

.align 2
hex1:
	ldr r1, =map
    ldrb r0, [r1, r0]
    bx lr
	