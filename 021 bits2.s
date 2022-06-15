// A test case to test your function with
.global _start
_start:
    ldr r0, =0x1000
    bl bits
    b _start        // End of testing code

// Return minimum number of bits to represent first parameter
bits:
	ands r1, r0, #0x80000000
    mvnmi r0, r0
    
	clz r1, r0
    mov r0, #32
    sub r0, r0, r1
    
    add r0, #1
    bx lr
	