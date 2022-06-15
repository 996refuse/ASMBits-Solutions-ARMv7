.data
.byte 0    // Strings aren't word-aligned
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strtolower
    1: b 1b

.global strtolower
strtolower:
    ldrb r1, [r0]
    cmp r1, #0
    beq exit

	cmp r1, #0x41
    blo continue
    cmp r1, #0x5a
    bhi continue
    
    add r1, #0x20
    strb r1, [r0]
continue:
	add r0, #1
    b strtolower
    
exit:
	bx lr
	
	