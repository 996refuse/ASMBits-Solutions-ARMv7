// A test case to test your function with
.global _start
_start:
    ldr r0, =2       // 2 = sign extend 8->32
    ldr r1, =0xf0    // The number to extend
    bl extend
    b _start        // End of testing code

// A function to extend. Only this part will be tested.
extend:
	ands r2, r0, #0b01
    bne _16bit
    lsl r1, #24
	b 1f
_16bit:
	lsl r1, #16
    ands r2, r0, #0b10
	bne _sign
    lsr r1, #16
    b 2f
_sign:
	asr r1, #16
    b 2f
1:
    ands r2, r0, #0b10
	bne _sign2
    lsr r1, #24
    b 2f
_sign2:
	asr r1, #24
	b 2f
2:
	mov r0, r1
    bx lr
    
    