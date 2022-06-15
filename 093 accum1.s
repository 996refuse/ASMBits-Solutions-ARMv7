// Some testing code
.data
Cmd: .string "+0+@-P"
.text

.global _start
_start:
	ldr r0, =Cmd
	bl calc	
	1: b 1b  // done

// Your function starts here:
calc:
	mov r3, #0

loop:
	ldrb r1, [r0]
    cmp r1, #0
    beq exit
	ldrsb r2, [r0, #1]

    add r0, #2

	cmp r1, #'+'
    addeq r3, r3, r2
	beq loop
	cmp r1, #'-'
    subeq r3, r3, r2
	beq loop
	cmp r1, #'*'
    muleq r3, r3, r2	
	beq loop
exit:
	mov r0, r3
    bx lr
	