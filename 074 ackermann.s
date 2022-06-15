.global _start
_start:
    mov r0, #1
    mov r1, #1
    bl ackermann
    1: b 1b

.global ackermann
ackermann:
	push {r1-r3, lr}
    cmp r0, #0
    beq exit0
    cmp r1, #0
    beq exit1
    
    sub r2, r0, #1
    sub r1, #1
    bl ackermann
    mov r1, r0
    mov r0, r2
    bl ackermann
	b exit
    
exit0:
	add r0, r1, #1
    b exit

exit1:
	sub r0, #1
    mov r1, #1
    bl ackermann
    b exit

exit:
    pop {r1-r3, lr}
    bx lr