%{
#include "parser.tab.hpp"
%}

%%
[ \t\n]+                ;
NIHAL                  return NIHAL;
[0-9]+                 { yylval.str = strdup(yytext); return NUM; }
[A-Za-z_][A-Za-z0-9_]* { yylval.str = strdup(yytext); return ID; }
"="                    return '=';
";"                    return ';';
","                    return ',';
.                      { printf("Unknown character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}