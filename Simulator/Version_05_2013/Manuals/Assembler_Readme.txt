 :: How to use the assembler ::

Write your program in the assembly language and save it as a plain text file.
Then run:

	Assembler.exe <input program.asm> <output file.mif>

 :: Assembly language ::

	Comments
		A semicolon (;) starts a comment. Everything after it to the end of the
		line is ignored by the assembler.

		Example:
		mov r0, r1 ; R0 receives the contents of R1

	Instruction format
		Write an instruction name, in upper or lower case, followed by its
		comma-separated arguments.

		Examples:
		add r0, r1, r2 ; R0 receives the sum of R1 and R2
		nop            ; do nothing
		rts            ; return

	Registers and operands
		Register arguments can be r0 through r7. The fr register is also accepted
		by push and pop, but is not implemented in this assembler version.

		Numeric operands can be a positive decimal number prefixed by #, a
		single-quoted character prefixed by #, or a label prefixed by #.
		Address operands can be a positive decimal number or a label.

		Examples:
		loadd r1, #50  ; load the number 50
		loadd r2, #'a' ; load the character 'a'
		store 100, r0  ; store R0 at memory address 100

		Special character literals include '\\', '\n', and '\0'. Characters use
		ASCII encoding.

		Write at most one instruction and one label per line. The processor is
		16-bit, so do not use numbers greater than 65535.

	Labels
		A word followed by a colon is a label, unless it is an instruction or
		register name. Labels may contain letters, digits, periods, and
		underscores.

		Examples:
		main: ; entry point
		vet: var #10 ; ten-element array
		codigo: ; code region

		Instructions that accept addresses can use labels in place of numeric
		addresses. Instructions that accept numbers can also use labels.

		Example:
		store variavel, r0
		load r0, #aux

		The assembler provides optional labels for function arguments and the
		return value: Arg0 through Arg9 and Ret.

	Optional directives
		var
			Reserves the given number of memory locations at the current position.
			Use it to declare variables or arrays.

			Examples:
			aux: var #1
			vet: var #10

			Jump over variable declarations so the processor does not execute
			them as instructions:

			jmp pula
			aux: var #1
			vet: var #10
		pula:

			Programs can write to memory and execute data as instructions by
			jumping or calling its address.

		string
			Stores a double-quoted string at the current position and reserves
			enough memory for it. The assembler adds a terminating '\0'. Supported
		escapes include '\\', '\n', '\0', and '\"'. Characters use ASCII.

			Example:
			jmp pula
		str: string "Hello, world!"
		pula:

		static
			Writes a number prefixed by # or a character to a memory address or
			label at assembly time. This is not an instruction and is not a STORE
			operation.

			Examples:
			jmp pula
		aux: var #1
			static aux, #50
		pula:

			Use a label plus an offset to initialize an array element:
			vet: var #10
			static vet + #5, #30

		alloc
			Allocates a label and the requested number of memory locations in the
			special memory region. Unlike var, alloc does not put data in the
			instruction stream, so you do not need to jump over it.

			Examples:
			alloc aux, #1
			static aux, #20
			alloc vet, #10
			static vet + #5, #30

 :: Changing the assembly language ::

Edit defs.h in the assembler source to change instruction and directive names,
opcodes, or the memory layout.

 :: Questions or bugs ::

Contact fabio914@gmail.com or fabioada@grad.icmc.usp.br.
