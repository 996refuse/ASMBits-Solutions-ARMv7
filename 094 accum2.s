// Some testing code
.data
Cmd:  .byte '+', 1,   'B', 1,   '+', 2,   '+', 3,   0
Cmd2: .byte '+', 1,   'b', 1,   '+', 2,   '+', 3,   0
.text

.global _start
_start:
	ldr r0, =Cmd
	bl calc	
	1: b 1b  // done

// Your function starts here:
calc:
	push {r4}
	mov r4, #0
	mov r3, #0

loop:
	ldrb r1, [r0, r4]
    cmp r1, #0
    beq exit
    
    add r4, #1
	ldrsb r2, [r0, r4]
    add r4, #1

	cmp r1, #'+'
    addeq r3, r3, r2
	beq loop
	cmp r1, #'-'
    subeq r3, r3, r2
	beq loop
	cmp r1, #'*'
    muleq r3, r3, r2	
	beq loop
    
	cmp r1, #'b'
    beq branch1
    cmp r1, #'B'
    beq branch2
    b loop
branch1:
    cmp r3, #0
    bge loop
    b branch
branch2:
	cmp r3, #0
    blt loop
    b branch
branch:
	add r4, r2, lsl #1
	b loop
exit:
	mov r0, r3
	pop {r4}
    bx lr
		