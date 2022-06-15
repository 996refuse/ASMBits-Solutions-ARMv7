// Insert declarations here

.equ LEDS, 0xff200000

.global get_led
// A function that returns the value of LEDS
get_led:
	ldr r0, =LEDS
    bx lr
	