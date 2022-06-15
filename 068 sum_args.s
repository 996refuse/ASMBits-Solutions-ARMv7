.global _start
_start:
	ldr sp, =0x40000000	// Initial sp
	mov r0, #2
	mov r1, #1
	mov r2, #2
	
	bl sum
	1: b 1b  // done

.global sum
sum:
	push {r1-r3}
    mov r3, sp
    
    mov r2, #0
loop:
	cmp r0, #0
    beq exit
    sub r0, #1
    ldr r1, [sp, r0, LSL #2]
    add r2, r1
    b loop
    
exit:
	mov r0, r2
    
    mov sp, r3
    pop {r1-r3}
	bx lr
	