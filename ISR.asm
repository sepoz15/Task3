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
	
	LDI R0, KBDR
	NOT R0, R0
	ADD R0, R0, #1
	LD R3, A
	ADD R3, R3, R0
	BRZ	VALID
	LD R3, U
	ADD R3, R3, R0
	BRZ	VALID
	LD R3, G
	ADD R3, R3, R0
	BRZ	VALID
	LD R3, C
	ADD R3, R3, R0
	BRZ	VALID
	BRNP	INVALID
VALID
	ADD R0, R0, #-1
	NOT R0, R0
	STI R0, STORE
	BRNZP	#2
INVALID
	AND R1, R1, #0
	STI R1, STORE
	RTI

STORE	.FILL x4600
KBSR	.FILL xFE00
KBDR	.FILL xFE02
MASK	.FILL x8000
A	.FILL x41
U	.FILL x55
G	.FILL x47
C	.FILL x43

		
