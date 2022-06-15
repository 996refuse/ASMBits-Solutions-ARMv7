// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

// Return the difference between max and min array elements
peak:
	push {r4-r7}


	ldr r2, =0x7f000000
    ldr r4, =0x80000000
    
loop:
    subs r0, #1
    bmi exit
    
    ldr r3, [r1, r0, LSL #2]
    cmp r2, r3
    movgt r2, r3
    cmp r4, r3
    movlt r4, r3
    
    b loop
    
exit:
	sub r0, r4, r2
	pop {r4-r7}
    bx lr
	
	