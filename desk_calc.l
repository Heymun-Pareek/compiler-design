
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "parser.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?  {
                       yylval.num = atof(yytext);
                       return NUMBER;
                   }

[a-z]              {
                       yylval.num = yytext[0] - 'a';
                       return REG;
                   }

"+"                { return PLUS; }
"-"                { return MINUS; }
"*"                { return MULTIPLY; }
"/"                { return DIVIDE; }
"%"                { return MODULO; }
"^"                { return POWER; }

"("                { return LPAREN; }
")"                { return RPAREN; }
"="                { return ASSIGN; }
";"                { return SEMICOLON; }

[ \t\r]+           { /* Ignore whitespace */ }
\n                 { return NEWLINE; }

.                  {
                       printf("Lexical Error: Invalid character '%s'\n", yytext);
                       return INVALID;
                   }
%%

int yywrap() {
    return 1;
}
