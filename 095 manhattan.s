.data
Map: .byte 1, 0, 0, 1, 0
.text

.global _start
_start:
    ldr r0, =5    // width
    ldr r1, =1    // height
    ldr r2, =Map // Pointer to 2D char array
    bl manhattan
    1: b 1b    // Done

manhattan:
	cmp	r0, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r3, r0, r0, lsr #31
	add	r9, r1, r1, lsr #31
	ble	.L9
	mov	r7, #0
	mov	r4, r0
	mov	r10, r7
	mvn	r0, #-2147483648
	asr	r9, r9, #1
	asr	r8, r3, #1
	sub	r5, r9, r1
.L3:
	cmp	r1, #0
	eorgt	r6, r8, r8, asr #31
	movgt	r3, r9
	subgt	r6, r6, r8, asr #31
	addgt	ip, r2, r7
	ble	.L8
.L5:
	ldrb	lr, [ip]
	cmp	lr, #0
	beq	.L4
	eor	lr, r3, r3, asr #31
	sub	lr, lr, r3, asr #31
	add	lr, r6, lr
	cmp	r0, lr
	movge	r0, lr
	mov	r10, #1
.L4:
	sub	r3, r3, #1
	cmp	r3, r5
	add	ip, ip, r4
	bne	.L5
.L8:
	add	r7, r7, #1
	cmp	r4, r7
	sub	r8, r8, #1
	bne	.L3
	cmp	r10, #0
	mvneq	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L9:
	mvn	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr

/*
#include <stdlib.h>

int manhattan (int width, int height, char* map)
{
	int x=width/2;
	int y=height/2;
	int d;
	int mind = 0x7fffffff;
	int f=0;

	for(int i=0; i<width; ++i)
	for(int j=0; j<height; ++j)
	{
		if(map[j*width + i])
		{
			f = 1;
			d = abs(x-i) + abs(y-j);
			mind = d < mind ? d : mind;
		}
	}
	if(f)
		return mind;
	else
		return -1;
}
*/
