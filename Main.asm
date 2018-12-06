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



		.END
