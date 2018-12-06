; Main.asm
; Name:Sumedh Zope
; UTEid: ssz274
; Continuously reads from x4600 making sure its not reading duplicate
; symbols. Processes the symbol based on the program description
; of mRNA processing.
               .ORIG x4000
; initialize the stack pointer
	LD R6, STACK



; set up the keyboard interrupt vector table entry
	LD R1, ISR
	STI R1, IVT


; enable keyboard interrupts
	LD R3, ENABLE
	STI R3, KBSR


; start of actual program

LOOP	LDI R0, STORE
	BRZ LOOP
	PUTC
	AND R3, R3, #0
	STI R3, STORE
	
	LD R3, SUCCESS
	BRP STOP
	
	NOT R0, R0
	ADD R0, R0, #1
	LD R3, A
	ADD R3, R3, R0
	BRNP #4
	AND R0, R0, #0
	ADD R0, R0, #-1
	ST R0, NUMBER
	BRNZP LOOP
	ADD R0, R0, #-1
	NOT R0, R0
		
	LD R3, NUMBER
	BRN TWO
	BRP THREE
ONE	
	NOT R0, R0
	ADD R0, R0, #1
	LD R3, A
	ADD R3, R3, R0
	BRNP RESTART
	AND R0, R0, #0
	ADD R0, R0, #-1
	ST R0, NUMBER
	BRNZP LOOP

TWO	
	NOT R0, R0
	ADD R0, R0, #1
	LD R3, U
	ADD R3, R3, R0
	BRNP RESTART
	AND R0, R0, #0
	ADD R0, R0, #1
	ST R0, NUMBER
	BRNZP LOOP

THREE	
	NOT R0, R0
	ADD R0, R0, #1
	LD R3, G
	ADD R3, R3, R0
	BRZ END
	BRNP RESTART
RESTART
	AND R0, R0, #0
	ST R0, NUMBER
	BRNZP LOOP
END
	LEA R0, STRING
	PUTS
	AND R0, R0, #0
	ADD R0, R0, #1
	ST R0, SUCCESS
	BRNZP LOOP

		.END
