// Some testing code
// You may uncomment these during testing, but comment them out before submitting
// odd: bx lr
// even: bx lr

.global _start
_start:
	ldr r0, =1    // First function parameter is always passed through r0.
	bl oddeven
	1: b 1b    // Done

oddeven:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	// Your code here
	ands r0, r0, #0x1
    blne odd
	bleq even // z=1
	// Restore lr and return. (This can be shortened to pop {pc} )
	pop {lr}
	bx lr
	
	