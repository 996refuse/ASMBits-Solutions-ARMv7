.data 
Array: .word 1, 2, 3, 4

.text
.global _start
_start:
    ldr r0, =Array
    mov r1, #4
    bl array_inc
    1: b 1b    // Done

.global array_inc
array_inc:
    subs r1, #1
    bmi exit
    
    ldr r2, [r0, r1, LSL #2]
    add r2, #1
    str r2, [r0, r1, LSL #2]
    b array_inc
    
exit:
    bx lr
	
	