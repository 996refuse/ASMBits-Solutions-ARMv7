// A test case to test your function with
.global _start
_start:
    ldr r0, =0x123    // First parameter is always in r0
    bl saturate
    b _start        // End of testing code

// Convert signed 32 bit to 8 bit, with saturation
saturate:
	cmp r0, #0x7f
    movgt r0, #0x7f
    
    cmp r0, #0xffffff80
	movlt r0, #0x80
    
    and r0, #0xff
	bx lr