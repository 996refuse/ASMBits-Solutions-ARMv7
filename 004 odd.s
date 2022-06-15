.global _start
_start:
    mov r0, #1
    bl odd
    1: b 1b    // Done

.global odd
odd:
	and r0, r0, #0x1
	bx lr
	
	