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
	push {r4}
	mov r2, #0
    mov r3, #10
    mov r4, #0
    
	ldrb r1, [r0]
    cmp r1, #45
    bne loop
    add r0, #1
    mov r4, #1
    
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
	cmp r4, #0
    beq return
    mvn r0, r0
    add r0, #1
return:
	pop {r4}
    bx lr
	

	