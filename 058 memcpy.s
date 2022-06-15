.data
.word 0x9999
Dest: .word 0, 0, 0, 0, 0xaaaa
Src: .word 1, 2, 3, 4, 0xbbbb

.text
.global _start
_start:
    ldr r0, =Dest
    ldr r1, =Src
    ldr r2, =16
    bl memcpy
    1: b 1b    // Done

.global memcpy
memcpy:
	subs r2, #1
    bmi exit
    ldrb r3, [r1, r2]
    strb r3, [r0, r2]
    b memcpy
    
exit:
	bx lr
    
	