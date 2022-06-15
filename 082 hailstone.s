.global _start
_start:
    mov r0, #5
    bl hailstone
    1: b 1b    // Done

.global hailstone
hailstone:
	mov r2, #0

loop:
	cmp r0, #1
    beq exit0
    
    ands r1, r0, #1
    lsreq r0, #1
    addne r1, r0, r0
    addne r0, r1
    addne r0, #1
    
    add r2, #1
    b loop
exit0:
	mov r0, r2
    bx lr
