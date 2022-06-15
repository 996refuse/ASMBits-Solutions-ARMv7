// Some testing code
.global _start
_start:
	bl where
	1: b 1b  // done

// Your function starts here:
where:
	sub r0, lr, #4
    bx lr
	