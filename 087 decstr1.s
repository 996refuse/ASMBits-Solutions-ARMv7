// A test case to test your function with
.data
Str: .string "1234"

.text
.global _start
_start:
    ldr r0, =Str    
    bl decstr
    b _start        // End of testing code

// Parse a decimal string
decstr:
	mov r2, #0
    mov r3, #10
    
loop:
    ldrb r1, [r0], #1
    cmp r1, #0
    beq exit
    sub r1, #48

	mul r2, r3
    add r2, r1
    b loop
    
    
exit:
	mov r0, r2
    bx lr
	
	