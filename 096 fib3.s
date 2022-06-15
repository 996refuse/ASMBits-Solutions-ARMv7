.global _start
_start:
    mov r0, #4
    bl numfib
    1: b 1b

.global numfib
numfib:
	push {r1-r3, lr}
	cmp r0, #0
    beq exit0
	cmp r0, #1
    beq exit1
    
    sub r2, r0, #1
    sub r3, r0, #2
    
    mov r0, r2
    bl numfib
    mov r2, r0
    
    mov r0, r3
    bl numfib
    mov r3, r0
   	
    add r0, r2, r3
exit0:
	add r0, #1
exit1:
	pop {r1-r3, lr}
	bx lr