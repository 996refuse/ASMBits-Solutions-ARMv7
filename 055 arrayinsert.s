.data 
// Leave some space for the expanded array
Array: .word 1, 2, 3, 4, 0xff, 0xff

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =4
    ldr r2, =2
    ldr r3, =123
    bl array_insert
    1: b 1b    // Done

array_insert:
	push {r4, r5}
loop:
	cmp r1, r2
    beq exit
    

    sub r5, r1, #1
    ldr r4, [r0, r5, LSL #2]
	str r4, [r0, r1, LSL #2]
    
    mov r1, r5
    b loop
    
exit:
	str r3, [r0, r1, LSL #2]
	pop {r4, r5}
    bx lr
	
	