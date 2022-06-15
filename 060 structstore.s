.data
List:
	.string "M5S3G4"
	.align 1
	.hword 416
	.string "V6T1Z4"
	.align 1
	.hword 604
	.string "K7L3N6"
	.align 1
	.hword 613
.align 2
PCode: .string "N2L3G1"

.text
.global _start
_start:
	ldr r0, =List
	mov r1, #1
	ldr r2, =PCode
	ldr r3, =519
	
	bl set_data
	1: b 1b  // done

set_data:
	push {r4}
    mov r4, #0xa
	mul r1, r4
    add r0, r1
    
    ldrb r1, [r2, #0]
    strb r1, [r0, #0]
    ands r1, #0xff
    beq exit
	
    ldrb r1, [r2, #1]
    strb r1, [r0, #1]
    ands r1, #0xff
    beq exit
    
    ldrb r1, [r2, #2]
    strb r1, [r0, #2]
    ands r1, #0xff
    beq exit
    
    ldrb r1, [r2, #3]
    strb r1, [r0, #3]
    ands r1, #0xff
    beq exit
    
    ldrb r1, [r2, #4]
    strb r1, [r0, #4]
    ands r1, #0xff
    beq exit
    
    ldrb r1, [r2, #5]
    strb r1, [r0, #5]

exit:
    strh r3, [r0, #8]
    
	pop {r4}
    bx lr
    