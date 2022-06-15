.global _start
_start:
	ldr sp, =0x40000000	// Initial SP
	ldr r0, =0x20000
	mov r1, #22
	mov r2, #17
1:	push {r1}
	sub r1, #1
	subs r2, #1
	bne 1b
		
	mov r1, #3
	mov r2, #4
	mov r3, #5
	
	bl pack20
	add sp, #68   // Caller cleans up the stack: Remove 17 parameters.
    1: b 1b  // done

.global pack20
pack20:
	push {r1-r3}
	push {r0-r7}
    mov r3, sp
    add r4, sp, #32
    
	mov r1, #0
    
loop:
    cmp r1, #20
    beq exit
    add r1, #1
    ldr	 r2, [r4], #4
    strb r2, [r0], #1
    b loop
    
exit:
    mov sp, r3
    pop {r0-r7}
   	pop {r1-r3}
	bx lr
	