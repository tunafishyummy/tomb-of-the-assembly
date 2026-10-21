#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "defs.h"
#include "assembler.h"
#include "parser.h"
#include "structs.h"

/* Estruturas de dados necessarias */

/* Estruturas para armazenar endereços dos labels */
Label labels[MAX_LABELS];
unsigned int label_cnt = 0;

/* Estruturas para armazenar EQUs */

/* Adiciona Label */
void AddLabel(char * nome, unsigned short end)
{
    if (label_cnt < MAX_LABELS)
    {
        strcpy(labels[label_cnt].Nome,nome);
        labels[label_cnt].End = end;
        label_cnt++;
    }
    else parser_Abort("Maximum number of labels reached!");
}

/* Find a label and return its address (make this more efficient later!) */
unsigned short FindLabel(char * nome)
{
    register unsigned int i = 0;
    while (i < label_cnt)
    {
        if (strcmp(labels[i].Nome,nome) == 0)
            return labels[i].End;
        i++;
    }
    parser_Abort("Invalid reference.");
    return 0;
}
