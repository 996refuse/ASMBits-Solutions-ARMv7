.data
A: .word B
B: .word C
C: .word 0
.text
.global _start
    ldr r0, =A
    bl listlen
1:  b 1b  // done

.global listlen
listlen:
	mov r1, #0
loop:
	cmp r0, #0
    beq exit
    add r1, #1
    ldr r0, [r0]
    b loop
exit:
	mov r0, r1
	bx lr
	