.global _start
_start:
    mov r0, #1  // First function parameter is always passed through r0.
    mov r1, #1  // Second function parameter is always passed through r1.
    bl add      // Return value is always in r0.
    1: b 1b     // Done

.global add
add:
	add r0, r0, r1
    bx lr
	
	