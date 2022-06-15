.global _start
_start:
    bl func
    1: b 1b  // done

func:
    // return 123: Set r0 = 123 and then return from the function.
	ldr r0, = 123
    bx lr
	