.data
Img: .skip 640*480*2
.text

.global _start
_start:
    ldr r0, =Img    // Image
    ldr r1, =1    // left
    ldr r2, =0    // top
    ldr r3, =3    // size
    bl square
    1: b 1b    // Done

square:
	push {r4-r11}
	ldr r7, =0xffff
    mov r9, r3
    mov r10, #1280
    
    mul r6, r2, r10
	add r6, r1, lsl #1
    
loop_out:
    mov r8, r3
loop:
    subs r8, #1
    bmi exit_loop
    lsl r11, r8, #1
    add r11, r6
    strh r7, [r0, r11]
    //strh r7, [r6, r8, lsl #1]
    b loop
exit_loop:
    subs r9, #1
    beq exit
    add r6, r10
    b loop_out
exit:
	pop {r4-r11}
    bx lr
	
	