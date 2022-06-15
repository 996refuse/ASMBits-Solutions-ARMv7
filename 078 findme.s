// Some testing code
.global _start
_start:
	bl where
	1: b 1b  // done

# Your function starts here:
where:
	ldr r0, =where
    bx lr
	