// Some input data and testing code
.data
ProdList: 
.word 0x1000, 10
.word 0x1001, 11
.word 0x1002, 9


.text
.global _start
_start:
	ldr r0, =ProdList
	ldr r1, =3
	bl sort
	
	1: b 1b  // done

// Your function starts here:
sort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L7:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L3
.L6:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bgt	.L4
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	bcs	.L5
.L4:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
.L5:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L6
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	bhi	.L7
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	
	