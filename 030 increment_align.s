.data
.byte 0    // Test with an unaligned word.
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl inc
    1: b 1b    // Done

.global inc
inc:
	ldrb r2, [r0, #0]
    add  r2, #1
    strb r2, [r0, #0]
    ands r2, #0xffffff00
    beq end
    
	ldrb r2, [r0, #1]
    add  r2, #1
    strb r2, [r0, #1]
    ands r2, #0xffffff00
    beq end

	ldrb r2, [r0, #2]
    add  r2, #1
    strb r2, [r0, #2]
    ands r2, #0xffffff00
    beq end
    
    ldrb r2, [r0, #3]
    add  r2, #1
    strb r2, [r0, #3]
    
end:
	bx lr
	