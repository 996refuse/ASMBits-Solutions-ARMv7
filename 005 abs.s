.global _start
_start:
    mov r0, #10
    bl abs
    1: b 1b    // Done

.global abs
abs:
	cmp r0, #0
    rsblt r0, r0, #0
    bx lr
	
	