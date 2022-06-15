// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =Array
    ldr r1, =3 
    bl arraysum
    b _start        // End of testing code

// Sum elements of array
arraysum:
	mov r2, #0
    
loop:
	subs r1, #1
    bmi exit
    ldr r3, [r0, r1, lsl #2]
    add r2, r3
    b loop
exit:
	mov r0, r2
    bx lr
	
	