; Non-recursive factorial
; Note: Results greater than 999 print as ????

jmp main

; Declaration and initialization of static variables

; ----------x--------------x-----------
main:	; Start of the program
	loadn r0, #5	; Choose the number whose factorial to calculate

	call Fatorial	; Calculate the factorial of the number in r0 and return it in r1

	mov r0, r1	; Move the result from r1 to r0 for printing
	loadn r1, #10	; Screen position where the value will be printed
	call Printnr	; Print a number below 1000: r0 = number, r1 = screen position

	halt	; Stop execution
; End of the program


; ----------x--------------x-----------
; Start of the subroutines

Fatorial:	; Calculate the factorial of the number in r0 and return it in r1
	push r0
	push r2

	loadn r1, #1
	loadn r2, #1

FatorialLoop:
	mul r1, r1, r0	; Multiply and accumulate in r1
	dec r0		; Decrement the number
	cmp r0, r2	; Compare with 1 to stop
	jgr FatorialLoop ; If greater than 1, repeat the loop

	pop r2
	pop r0	
	rts		; End of the subroutine; return the factorial in r1





Printnr:	; Print a number below 1000: r0 = number, r1 = screen position
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	loadn r3, #9
	loadn r2, #48
	cmp r0, r3
	jgr PrintnrDezena ; If below 10, print the value
	add r0, r0, r2	; Add 48, the ASCII code for the character 0
	outchar r0, r1	; Print to the screen
	jmp PrintnrRts	; End of the subroutine

PrintnrDezena:
	loadn r3, #99
	cmp r0, r3
	jgr PrintnrCentena	; If below 100, print two characters
	loadn r6, #10
	div r4, r0, r6
	loadn r2, #48
	add r5, r4, r2
	outchar r5, r1
	mul r4, r4, r6
	sub r0, r0, r4
	add r0, r0, r2
	inc r1
	outchar r0, r1
	jmp PrintnrRts	; End of the subroutine

PrintnrCentena:
	loadn r3, #999
	cmp r0, r3
	jgr PrintnrMilhar	; If below 1000, print three characters
	loadn r6, #100
	div r4, r0, r6
	loadn r2, #48
	add r5, r4, r2
	outchar r5, r1
	mul r4, r4, r6
	sub r4, r0, r4
	loadn r6, #10
	div r0, r4, r6
	loadn r2, #48
	add r5, r0, r2
	inc r1
	outchar r5, r1
	mul r0, r0, r6
	sub r0, r4, r0
	add r0, r0, r2
	inc r1
	outchar r0, r1
	jmp PrintnrRts	; End of the subroutine

PrintnrMilhar:		; If greater than 999, print ????
	loadn r0, #'?'
	outchar r0, r1
	inc r1
	outchar r0, r1
	inc r1
	outchar r0, r1
	inc r1
	outchar r0, r1

PrintnrRts:	; End of the subroutine
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts	; Return from the subroutine with all registers unchanged
	




