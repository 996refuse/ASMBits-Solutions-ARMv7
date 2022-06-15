// A test case to test your function with
MyString: .skip 12    // Reserve some space to hold the output string

.global _start
_start:
    ldr r0, =MyString     // First parameter: Where to write
    ldr r1, =0x12345678   // Second parameter: The number to process
    bl hexstr
    b _start        // End of testing code

num:
.string "0123456789abcdef"

.align 2
// Convert number to string
hexstr:
	push {r0-r7}
    ldr r4, =num
    mov r2, #32  // -4
    
loop:
	sub r2, #4
    
    mov r3, r1
    ror r3, r2
    and r3, #0xf
    cmp r3, #0
    bne start
    
    cmp r2, #0
    beq exit0
    b loop
    
start:    
    ldrb r5, [r4, r3]
    strb r5, [r0], #1
    
    cmp r2, #0
    beq exit1
    sub r2, #4
    
    mov r3, r1
    ror r3, r2
    and r3, #0xf
    
    b start

exit0:
	mov r5, #'0'
    strb r5, [r0], #1
	mov r5, #0
    strb r5, [r0]
	pop {r0-r7}
    bx lr
    
exit1:
	mov r5, #0
    strb r5, [r0]
	pop {r0-r7}
    bx lr	
	