// Some testing code
// Make sure to submit without "MyFunc" defined in your code, or you will get a "multiple definition" error.
// MyFunc: ret

.global _start
_start:
	bl get_opcode
	1: b 1b  // done

// Your function starts here:
get_opcode:
	ldr r0, =MyFunc
    ldr r0, [r0]
    bx lr
	