.data
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strlen
    1: b 1b

.global strlen
strlen:
    MOV R1, #0
LOOP:
    LDRB R2, [R0, R1]
    CMP R2, #0
    ADDNE R1, #1
    BNE LOOP
    MOV R0, R1
    BX LR
    
    
/*    
	mov r1, #0
do:
	ldrb r2, [r0], #1
    ands r2, #0xff
    beq exit
    add r1, #1
    b do
    
exit:
	mov r0, r1
    bx lr
*/