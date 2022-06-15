// You may uncomment these during testing
// add_a: ret
// add_b: ret
// add_c: ret
// add_d: ret
// add_e: ret
// done: ret

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
    blne add_a
	ands lr, r0, #0x2
    blne add_b
	ands lr, r0, #0x4
    blne add_c
	ands lr, r0, #0x8
    blne add_d
	ands lr, r0, #0x10
    blne add_e
    
    bl done

	// ARM: Return by popping lr directly into pc
	pop {pc}
	
	