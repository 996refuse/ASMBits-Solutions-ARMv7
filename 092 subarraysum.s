// A test case to test your function with
Array: .word 1, 1, 3, 1, 3, 2

.global _start
_start:
    ldr r0, =Array
    ldr r1, =6
    bl subarraysum
    b _start        // End of testing code

// Sum elements of array
subarraysum:
	push {r4-r7}
    ldr r7, =0x80000000 // result
    mov r6, #0 // min
    mov r5, #0 // sum
1:
    subs r1, #1
    bmi 2f
    ldr r2, [r0, r1, lsl #2]
    // sum
    add r5, r2
    // res
    sub r4, r5, r6
    cmp r4, r7
    movgt r7, r4
    // min
    cmp r5, r6
    movlt r6, r5
    b 1b
2:
	mov r0, r7
	pop {r4-r7}
	bx lr

/*/
    push {r1-r7}
	mov r2, #0 // index
    mov r3, #0 // sum
1:
	cmp r2, r1
    beq 2f
    ldr r4, [r0, r2, lsl #2]
    add r3, r4
    str r3, [r0, r2, lsl #2]
    add r2, #1
    b 1b
2:
	mov r2, #0 // index
    mov r3, #0 // min
    ldr r5, =0x80000000 // result
3:
    cmp r2, r1
    beq 4f
    ldr r4, [r0, r2, lsl #2]
    
    sub r6, r4, r3
    cmp r5, r6
    movlt r5, r6
    
	cmp r3, r4
    movgt r3, r4    
	
    add r2, #1
    b 3b
4:
	mov r0, r5
    pop {r1-r7}
    bx lr
*/
