// A test case to test your function with
.global _start
_start:
    ldr r0, =0x11223344
    bl bswap
    b _start        // End of testing code

// Byte swap
bswap:
	rev r0, r0
    bx lr
	
	