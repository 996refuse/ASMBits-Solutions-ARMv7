// Some input data and testing code
.data
ProdList: 
.word 0x1000, 10
.word 0x1001, 11	// 11 is the maximum profit. Product_id=0x1001
.word 0x1002, 9
.word 0x1003, 0xffffffff
.word 0x1005, 0x7fffffff

ProdInfo:
.word 0x1000, 0x200
.word 0x1001, 0x210	// Product_id 0x1001 has name 0x210. Return 0x210.
.word 0x1002, 0x220
.word 0x1004, 0x2f0


.text
.global _start
_start:
	ldr r0, =ProdList
	ldr r1, =5
	ldr r2, =ProdInfo
	ldr r3, =4
	bl find
	
	1: b 1b  // done

// Your function starts here:
find:
	push {r1-r8}
    mov r5, #0x80000000
do:
	subs r1, #1
    bmi do_exit
    
    add r6, r0, r1, lsl #3
    ldr r7, [r6, #4]
    
    cmp r7, r5
    blt do
    
    mov r5, r7
    ldr r8, [r6, #0]
    b do

do_exit:
	mov r0, #0
do2: 
	subs r3, #1
    bmi do2_exit
    add r6, r2, r3, lsl #3
    ldr r7, [r6, #0]
    
    cmp r7, r8
    beq found
    b do2
    
found:
	ldr r0, [r6, #4]
do2_exit:
	pop {r1-r8}
	bx lr
    
    
	
	