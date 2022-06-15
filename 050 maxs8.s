// A test case to test your function with
.data
Array: .byte 1, 2, 3

.text
.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
	ldr r2, =0x80000000
    
loop:
    subs r0, #1
    bmi exit
    
    ldrsb r3, [r1, r0]
    cmp r2, r3
    movlt r2, r3
    b loop
    
exit:
	mov r0, r2
    bx lr
	