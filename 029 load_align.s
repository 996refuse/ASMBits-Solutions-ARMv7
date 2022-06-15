.data
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl load
    1: b 1b    // Done

.global load
load:
	mov r1, #0
    
    
	ldrb r2, [r0, #3]
    orr r1, r2, r1, lsl #8
    
    ldrb r2, [r0, #2]
    orr r1, r2, r1, lsl #8
    
    ldrb r2, [r0, #1]
    orr r1, r2, r1, lsl #8
    
    ldrb r2, [r0, #0]
    orr r1, r2, r1, lsl #8
    
    mov r0, r1
	bx lr
	