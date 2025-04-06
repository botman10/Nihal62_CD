%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char* s);
int yylex(void);
float final_result = 0.0;
%}

%union {
    char* str;
    float fval;
}

%token <str> ID
%token <str> NUM
%token SI NIHAL

%type <str> stmt
%type <fval> expr

%%

program:
    stmt
;

stmt:
    ID '=' expr ';' {
        printf("\n[Three Address Code]\n%s = %.2f\n", $1, $3);
        printf("\n[Final Code]\nSTORE %s\n", $1);
    }
    |
    NIHAL ID '=' NUM ',' NUM ',' NUM ';' {
        float a = atof($4);
        float b = atof($6);
        float c = atof($8);
        final_result = a*a + b*b - c*c;

        printf("\n[Three Address Code]\nt1 = %.2f * %.2f\n", a, a);
        printf("t2 = %.2f * %.2f\n", b, b);
        printf("t3 = %.2f * %.2f\n", c, c);
        printf("t4 = t1 + t2\n");
        printf("%s = t4 - t3\n", $2);

        printf("\n[Optimized Instruction]\nNIHAL %s = %s, %s, %s\n", $2, $4, $6, $8);
        printf("\n[Evaluated Result] %s = %.2f\n", $2, final_result);
        printf("\n[Final Code]\nSTORE %s\n", $2);
    }
;

expr:
    NUM {
        $$ = atof($1);
    }
;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}