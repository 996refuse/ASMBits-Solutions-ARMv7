.global _start
_start:
	ldr r0, =0xff3100
	bl memenable
1:	b 1b    // Done

memenable:
    ldr r2, =0xff3
	lsr r1, r0, #12
    cmp r1, r2
    bne exit0
    
    lsr r0, #8
    and r0, #0xf
    bx lr
    
exit0:
	mov r0, #-1
    bx lr
