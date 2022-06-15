.global _start
_start:
	ldr sp, =0x40000000	// Initial sp
	mov r0, #2
	mov r1, #1
	mov r2, #2
	
	bl max
	1: b 1b  // done

.global max
max:
	cmp r0, #0
    beq exit2
    
	push {r1-r3}
    mov r3, sp
    ldr r2, =0x80000000
    
loop:
	subs r0, #1
    bmi exit
    ldr r1, [r3], #4
    cmp r2, r1
    bge loop
    mov r2, r1
    b loop
    
exit:
	mov r0, r2
	pop {r1-r3}
exit2:
	bx lr
    
    
	
	