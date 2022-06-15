.global _start
_start:
	ldr sp, =0x04000000	// Initial sp
	sub sp, sp, #64	// 16 stack parameters
	mov r0, #5
	mov r1, #20
	mov r2, sp
initloop:
	str r0, [r2], #4       // Post-indexed addressing: Add 4 to r2 after
	add r0, r0, #1
	cmp r0, r1
	ble initloop

	mov r0, #1
	mov r1, #2
	mov r2, #3
	mov r3, #4
	
	bl sum
	add sp, sp, #64	// Clean up stack
	1: b 1b  // done

sum:
	push {r0-r3}
    mov r3, sp
        
    mov r0, #0
    
    mov r2, #20
loop:
	cmp r2, #0
    beq exit
    sub r2, #1

	ldr r1, [sp, r2, LSL #2]
    add r0, r1
    b loop
    
exit:    
    mov sp, r3
    pop {r1-r3}
    pop {r1}
	bx lr
	
	