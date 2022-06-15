// Declare something
.data
Data:
.word A - 0x1 //r3

A:
.word B - 0x2 //r4

B:
.word Data //r5


.text
.global _start
_start:
	ldr r2, =Data    // Data
	ldr r3, [r2]     // A - 0x1
	ldr r4, [r3, #1] // B - 0x2
	ldr r5, [r4, #2] // Data
    1: b 1b    // Done
	
	