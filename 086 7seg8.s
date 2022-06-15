// Some testing code
.global _start
_start:
	ldr r0, =8
	bl hexdisplay
	1: b 1b  // done

// Your function starts here:
hexdisplay:
	push {r4}
	ldr r4, =pattern
	mov r3, r0
    
	mov r1, #0
    
    mov r2, #0xf
    and r2, r3, lsr #28
    ldrb r2, [r4, r2]
    orr r1, r2
    lsl r1, #8
    mov r2, #0xf
    and r2, r3, lsr #24
    ldrb r2, [r4, r2]
    orr r1, r2
    lsl r1, #8
    mov r2, #0xf
    and r2, r3, lsr #20
    ldrb r2, [r4, r2]
    orr r1, r2
    lsl r1, #8
    mov r2, #0xf
    and r2, r3, lsr #16
    ldrb r2, [r4, r2]
    orr r1, r2

	mov r0, #0

    mov r2, #0xf
    and r2, r3, lsr #12
    ldrb r2, [r4, r2]
    orr r0, r2
    lsl r0, #8
    
    mov r2, #0xf
    and r2, r3, lsr #8
    ldrb r2, [r4, r2]
    orr r0, r2
    lsl r0, #8
    
    mov r2, #0xf
    and r2, r3, lsr #4
    ldrb r2, [r4, r2]
    orr r0, r2
    lsl r0, #8
    
    mov r2, #0xf
    and r2, r3, lsr #0
    ldrb r2, [r4, r2]
    orr r0, r2
	pop {r4}
    bx lr

pattern:
.byte 0x3f, 0x6, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x7, 0x7f, 0x6f, 0x77, 0x7c, 0x58, 0x5e, 0x79, 0x71

	