.global _start
_start:
    ldr r0, =2    // First function parameter is always passed through r0.
    bl random
    1: b 1b    // Done

random:
    mov r3, r0
	ldr r1, =134775813
	mov r0, #0    
    
loop:
    cmp r3, #0
    beq exit
    sub r3, #1
    
	umull r0, r2, r0, r1
    add r0, #1
    b loop
    
exit:
    bx lr
    
	
	