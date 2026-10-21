How to compile
==============

Before compiling, make sure the folder containing the GCC C compiler is on
PATH. Then run:

  compile_compiler.bat
  compile_assembler.bat

How to use the compiler
=======================

Write a program in the high-level language and save it as a plain text file.
To compile a file that contains main, run:

  compilador <source file> <output .asm file> -main

To compile a file without main, for use as a library, run:

  compilador <source file> <output .asm file> -nomain

How to use the assembler
========================

Write an assembly source file and run:

  Assembler <input .asm file> <output .mif file>

See ../Assembler_Readme.txt for the assembly syntax and assembler directives.

High-level language notes
=========================

Using the high-level language is not recommended for this processor project;
the processor may not support all of its features. The language is based on C,
but it has fewer features and some syntax differs. See language_syntax.txt
for the supported syntax and commands.

The lib folder contains code snippets. In a high-level source file, import a
library like this:

  import "lib/print.asm";

In assembly source, copy the required function code into your .asm file.

Questions or bugs
=================

Contact fabio914@gmail.com or fabioada@grad.icmc.usp.br.
