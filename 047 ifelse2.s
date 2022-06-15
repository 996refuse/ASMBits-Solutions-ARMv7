// Some testing code
// You may uncomment these during testing
// add_a: bx lr
// add_b: bx lr
// add_c: bx lr
// add_d: bx lr
// add_e: bx lr
// done: bx lr

.global _start
_start:
	ldr r0, =5    // First function parameter is always passed through r0.
	bl build
	1: b 1b    // Done

build:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	// Your code here
	ands lr, r0, #0x1
    movne r0, #0
    blne add_a
    
	ands lr, r0, #0x2
    movne r0, #0
    blne add_b
    
	ands lr, r0, #0x4
    movne r0, #0
    blne add_c
    
	ands lr, r0, #0x8
    movne r0, #0
    blne add_d
    
	ands lr, r0, #0x10
    movne r0, #0
    blne add_e
    

    bl done

	// Restore lr and return.
	pop {pc}
	
	