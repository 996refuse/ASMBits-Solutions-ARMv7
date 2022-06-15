.global _start
	ldr sp, =0x40000000
	mov r0, #10
	mov r1, #10
	mov r2, #20
	mov r3, #30
	bl call1234
	1: b 1b

//secret:  // For debugging, uncomment this label
             // Don't submit with this label though, or you will get a duplicate label error.
	mov r0, #10
	bx lr

.global call1234
call1234:
	push {r0-r3, lr}
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    bl secret
    
    mov r2, #0
    pop {r1}
    cmp r1, r0
    addeq r2, #1
    
    pop {r1}
    cmp r1, r0
    addeq r2, #1
    
    pop {r1}
    cmp r1, r0
    addeq r2, #1
    
    pop {r1}
    cmp r1, r0
    addeq r2, #1
    
    mov r0, r2
    pop {lr}
    bx lr
	
	