.data
// This direct-mapped cache has 4 sets/blocks. Their tags are 0, 0x100, 0xc0, and 0x40
// for set 0, 1, 2, and 3, respectively.
CacheTags:
.word 0
.word 0x100
.word 0xc0
.word 0x40

AddressList:
.word 0x110	// This is hit (set 1)
.word 0x120	// This is a miss (set 2)
.word -1

.text
.global _start
_start:
	ldr sp, =0x4000000	// This problem will probably use the stack
	ldr r0, =4	// Cache has 2^4 byte blocks
	ldr r1, =2	// Cache has 2^2 sets
	ldr r2, =CacheTags
	ldr r3, =AddressList
	bl cachehits

cachehits:
	push {r1-r7, lr}
	mov r5, #0
    mov r6, r3
    mov r7, r0
loop:
    ldr r4, [r6], #4
    cmp r4, #0xffffffff
    beq exit
    mov r3, r4
    mov r0, r7
    bl cachehit
    cmp r0, #1
    addeq r5, #1
    b loop
exit:
	mov r0, r5
	pop {r1-r7, lr}
	bx lr

cachehit:
	push {r1-r7}
	lsr r4, r3, r0
    mov r5, #32
    sub r5, r1
    lsl r4, r5
    lsr r4, r5
    lsl r4, #2
    
    ldr r5, [r2, r4]
    
    eor r5, r3
    lsr r5, r0
    lsrs r5, r1
    moveq r0, #1
    movne r0, #0
	pop {r1-r7}
	bx lr
	