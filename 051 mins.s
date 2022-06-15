// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl min
    b _start        // End of testing code

// Return minimum element of signed array
min:
	ldr r2, =0x7f000000
    
loop:
    subs r0, #1
    bmi exit
    
    ldr r3, [r1, r0, LSL #2]
    cmp r2, r3
    movgt r2, r3
    b loop
    
exit:
	mov r0, r2
    bx lr
	