/*definition section*/
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "parser.tab.h"
%}

/* Error handling: MUST BE LAST */
/* yytext is predef variable in lex that stores actual text matched by the current lexer rule*/
/* yylval yylval is a special variable provided by Bison that Flex uses to pass the actual value of a token to the parser.*/
%%
[0-9]+(\.[0-9]+)?  { 
    yylval.num = atof(yytext);
    return NUMBER; 
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

. {
    printf("Lexical Error: Invalid character '%s'\n", yytext);
    return INVALID;
}

%%


/*yywrap wraps the rule section*/
/*yylex is the main flex function that runs the rule section*/
int yywrap(){}
