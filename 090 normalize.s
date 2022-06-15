// A test case to test your function with

Input: .word 0x10, 0x20, 0x80, 0x4
Output: .skip 8

.global _start
_start:
    ldr r0, =4
    ldr r1, =Input
    ldr r2, =Output
    bl normalize
    b _start        // End of testing code

// Normalize to U16
normalize:
	push {r0-r7}
    mov r3, r0
    mov r5, #0
    
loop:
    subs r3, #1
    bmi exit_loop
    ldr r6, [r1, r3, lsl #2]
    cmp r6, r5
    movhi r5, r6
    b loop
	
exit_loop:
    clz r5, r5
	
loop2:
    subs r0, #1
    bmi exit_loop2
    
	ldr r6, [r1, r0, lsl #2]
    
    subs r4, r5, #16
    lslpl r6, r4
    mvnmi r4, r4
    addmi r4, #1
    lsrmi r6, r4
    
    lsl r7, r0, #1 // instruction does not accept scaled register index
   	strh r6, [r2, r7]
    b loop2
    
exit_loop2:
    //str r5, [r2]
	pop {r0-r7}    
	bx lr
	