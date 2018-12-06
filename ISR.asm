; ISR.asm
; Name:Sumedh Zope
; UTEid: ssz274
; Keyboard ISR runs when a key is struck
; Checks for a valid RNA symbol and places it at x4600
               .ORIG x2600
	LDI R1, KBSR
	LD R0, MASK
	AND R0, R0, R1
	BRZ INVALID

STORE	.FILL x4600
KBSR	.FILL xFE00
KBDR	.FILL xFE02
MASK	.FILL x8000
A	.FILL x41
U	.FILL x55
G	.FILL x47
C	.FILL x43

		.END
