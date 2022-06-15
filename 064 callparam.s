.global _start
_start:
	bl call1234
	1: b 1b

//secret:  // For debugging, uncomment this label
             // Don't submit with this label though, or you will get a duplicate label error.
	mov r0, #1
	bx lr

.global call1234
call1234:
	push {lr}
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    bl secret
    pop {lr}
    bx lr
	
	