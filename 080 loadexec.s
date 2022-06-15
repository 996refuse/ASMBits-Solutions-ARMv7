// Some testing code
// When debugging in CPUlator, turn off the following debugging checks:
// - Instruction fetch: Modified opcode
// - Instruction fetch: Outside a code section (If Dest is outside the .text section)

Src: 
	add r0, r0, r0	// This function returns double its parameter.
	bx lr
Dest:
	.skip 8		// Make space for the code

.global _start
_start:
	ldr r0, =Dest
	ldr r1, =Src
	ldr r2, =8	// There are 2 instructions to copy: 8 bytes
	ldr r3, =4	// Let's call the function with parameter 4
	bl loadexec
	1: b 1b  // done

// Your function starts here:
loadexec:
	push {r1-r5, lr}
    mov r5, r0
    
loop:
    cmp r2, #0
    beq exit_loop
    sub r2, #1
    ldrb r4, [r1], #1
    strb r4, [r0], #1
    b loop

exit_loop:
	mov r0, r3
	blx r5

	pop {r1-r5, lr}
	bx lr
