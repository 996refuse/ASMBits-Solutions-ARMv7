// Declare something
.data
Data:
.word 0, 0x00001234, 0x90005678

.text
.global _start
_start:
    ldr r0, =Data
    ldr r1, [r0, #4]
    ldrh r2, [r0, #8]
    ldrb r3, [r0, #11]
    1: b 1b    // Done
	
	