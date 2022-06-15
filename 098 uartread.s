.data
Out: .skip 256	// Reserve some space for output

.text
//read_uart:	// This may be useful for debugging
	ldr r0, =0xff201000
	ldr r0, [r0]
	bx lr

.global _start
_start:
	ldr sp, =0x04000000	// Initialize SP for debugging.
	ldr r0, =Out		// Use Out as the output string
	bl uartgets
1:	b 1b			// Done


uartgets:
	push {lr}
    mov r1, r0
    mov r2, #0
    
loop:
	//wfe
	bl read_uart
    ands r3, r0, #0x8000
    beq loop
    
    and r0, #0xff
    cmp r0, #0x0d
    beq exit
    
    add r2, #1
    strb r0, [r1], #1
    b loop
    
    
exit:
	mov r0, #0
    strb r0, [r1]
	mov r0, r2
	pop {lr}
	bx lr
    
	
	