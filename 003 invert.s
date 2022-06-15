.global _start
_start:
    mov r0, #1
    bl invert
    1: b 1b    // Done

.global invert
invert:
	mvn r0, r0
    bx lr
	