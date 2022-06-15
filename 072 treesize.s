.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    bl size
    1: b 1b

.global size
size:
	push {r1-r3, lr}
    mov r1, r0
    
    ldr r2, [r1, #0]
    cmp r2, #0
    beq skip1
    
    mov r0, r2
    bl size
    mov r2, r0
skip1:
    ldr r3, [r1, #4]
    cmp r3, #0
    beq skip2
    
    mov r0, r3
    bl size
    mov r3, r0
skip2:
	add r0, r2, r3
    add r0, #1    
	pop {r1-r3, lr}
    bx lr
	