.data
.word 0x9999
Dest: .word 0, 0, 0, 0, 0xaaaa
Src: .word 1, 2, 3, 4, 0xbbbb

.text
.global _start
_start:
    ldr r0, =Dest
    ldr r1, =Src
    ldr r2, =16
    bl memmove
    1: b 1b    // Done

.global memmove
memmove:
	push {r4}
	cmp r0, r1
    beq exit
    bhi 1f
    mov r3, #0
    blo 2f
1:
	// high to low
    subs r2, #1
    bmi exit
    ldrb r3, [r1, r2]
    strb r3, [r0, r2]
    b 1b
2:
    // low to high
    cmp r3, r2
    beq exit
    ldrb r4, [r1, r3]
    strb r4, [r0, r3]
    add r3, #1
    b 2b
exit:
	pop {r4}
	bx lr
/*
	push {r0-r4}
    mov r3, r2
1:
	subs r3, #1
    bmi 2f
    ldrb r4, [r1, r3]
    push {r4}
    b 1b
2:
	add r3, #1
    cmp r2, r3
    beq 3f
    pop {r4}
    strb r4, [r0, r3]
    b 2b
3:
	pop {r0-r4}
    bx lr
*/
