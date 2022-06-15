// A test case to test your function with
.global _start
_start:
    mov r0, #255
    bl popcount
    1: b 1b    // Done

// Only your function (starting at popcount) is judged. The test code above is not executed.

/*
popcount:
	mov r3, #0
start:
	AND r2, r0, #0x1
    CMP r2, #0
    BEQ continue
    ADD r3, r3, #1
continue:
	MOV r0, r0, LSR #1
    CMP r0, #0
    BEQ exit
    b start
exit:
	MOV r0, r3
    bx lr
*/

/*
popcount:
	mov    r1,r0,lsr #31        @ start with r1 = the high bit of r0 (right shift by 31 bits)
loop:
	movs     r0,r0,lsl #2       @ left shift r0 by 2, and set flags on the result
	adc  r1,r1,r0,lsr #31
	bne  loop                   @ loop if r0 is non-zero (testing flags set by movs)
	mov r0, r1
    bx lr
*/

LUT:
    .word   0
    .word   1
    .word   1
    .word   2
    .word   1
    .word   2
    .word   2
    .word   3
    .word   1
    .word   2
    .word   2
    .word   3
    .word   2
    .word   3
    .word   3
    .word   4
    .word   1
    .word   2
    .word   2
    .word   3
    .word   2
    .word   3
    .word   3
    .word   4
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   1
    .word   2
    .word   2
    .word   3
    .word   2
    .word   3
    .word   3
    .word   4
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   1
    .word   2
    .word   2
    .word   3
    .word   2
    .word   3
    .word   3
    .word   4
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   4
    .word   5
    .word   5
    .word   6
    .word   5
    .word   6
    .word   6
    .word   7
    .word   1
    .word   2
    .word   2
    .word   3
    .word   2
    .word   3
    .word   3
    .word   4
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   4
    .word   5
    .word   5
    .word   6
    .word   5
    .word   6
    .word   6
    .word   7
    .word   2
    .word   3
    .word   3
    .word   4
    .word   3
    .word   4
    .word   4
    .word   5
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   4
    .word   5
    .word   5
    .word   6
    .word   5
    .word   6
    .word   6
    .word   7
    .word   3
    .word   4
    .word   4
    .word   5
    .word   4
    .word   5
    .word   5
    .word   6
    .word   4
    .word   5
    .word   5
    .word   6
    .word   5
    .word   6
    .word   6
    .word   7
    .word   4
    .word   5
    .word   5
    .word   6
    .word   5
    .word   6
    .word   6
    .word   7
    .word   5
    .word   6
    .word   6
    .word   7
    .word   6
    .word   7
    .word   7
    .word   8

/*

temp:
    .word   0
    .word   0
    .word   0
    .word   0

popcount:
	MOV r3, #0xFF    
	AND r1, r3, r0, LSR #0 
    LDR r3, =LUT
    LDR r1, [r3, r1, LSL #2]
	LDR r3, =temp
	STR r1, [r3, +#0]
    
    MOV r3, #0xFF    
	AND r1, r3, r0, LSR #8 
    LDR r3, =LUT
    LDR r1, [r3, r1, LSL #2]
	LDR r3, =temp
	STR r1, [r3, +#4]
    
    MOV r3, #0xFF    
	AND r1, r3, r0, LSR #16 
    LDR r3, =LUT
    LDR r1, [r3, r1, LSL #2]
	LDR r3, =temp
	STR r1, [r3, +#8]
    
    MOV r3, #0xFF    
	AND r1, r3, r0, LSR #24 
    LDR r3, =LUT
    LDR r1, [r3, r1, LSL #2]
	LDR r3, =temp
	STR r1, [r3, +#12]
	
    MOV r0, #0
    LDR r1, [r3, +#0]
    ADD r0, r1
    LDR r1, [r3, +#4]
    ADD r0, r1
    LDR r1, [r3, +#8]
    ADD r0, r1
    LDR r1, [r3, +#12]
    ADD r0, r1
    
    BX lr
*/


popcount:
	PUSH {r4-r6}
	MOV r5, #0xFF    
    LDR r6, =LUT

	AND r1, r5, r0, LSR #0 
	AND r2, r5, r0, LSR #8
	AND r3, r5, r0, LSR #16 
	AND r4, r5, r0, LSR #24
    
    LDR r1, [r6, r1, LSL #2]
    LDR r2, [r6, r2, LSL #2]
    LDR r3, [r6, r3, LSL #2]
    LDR r4, [r6, r4, LSL #2]
    
    ADD r5, r1, r2
    ADD r6, r3, r4
    ADD r0, r5, r6
   	
    POP {r4-r6}
    BX lr

