#include <stdio.h>
#include <stdlib.h>
#include "defs.h"
#include "parser.h"
#include "structs.h"
#include "assembler.h"

/* Assembler version */
#define VERSAO "0.0"

/* Input and output files */
FILE *in;
FILE *out;

int main(int argc, char *argv[])
{

    if (argc < 3)
    {
        printf("Assembler:\nUsage: %s <input text file> <output .mif file>\n",argv[0]);
#ifndef __linux__
        system("pause");
#endif
        exit(1);
    }

    printf("Assembler v.%s\n",VERSAO);

    CarregaPrograma(argv[1]);

    out = fopen(argv[2],"w");

    if (out == NULL)
    {
        parser_Abort("Could not create output file!");
    }

    Montar();

    fclose(out);

    return 0;

}
