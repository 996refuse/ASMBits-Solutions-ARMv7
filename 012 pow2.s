.global _start
_start:
	ldr r0, =4
	bl pow2
1:	b 1b    // Done

/*
pow2:
	MOV r1, r0, LSR #1
	RBIT r1, r1
    SUB r1, r1, #1
	RBIT r1, r1
	SUB r0, r0, #1
    AND r2, r0, r1
    ORR r3, r0, r1
    MOV r0, #0

	CMP r2, #0
    BNE t
	CMP r3, #0xffffffff
    BNE t
    MOV r0, #1
t:
	bx lr
*/
    
pow2:
    SUB R1, R0, #1
    AND R1, R0
    CMP R1, #0
    MOVEQ R0, #1
    MOVNE R0, #0
    BX LR