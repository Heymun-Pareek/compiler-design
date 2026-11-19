
/*yylex() calls the lexer to get the next token*/
/*yyerror() handles syntax errors*/
%{
#include <stdio.h>
#include <math.h>

int yylex();
int yyerror(char *s);
%}

/*data types*/
%union {
    double num;
}

%token <num> NUMBER
%token PLUS MINUS MULTIPLY DIVIDE MODULO POWER
%token LPAREN RPAREN ASSIGN SEMICOLON NEWLINE INVALID

%type <num> expr

%left PLUS MINUS
%left MULTIPLY DIVIDE MODULO
%right POWER
%right UMINUS

%%

input:
      /* empty */
    | input line
    ;

line:
      NEWLINE
    | expr NEWLINE       { printf("Result = %g\n", $1); }
    | expr SEMICOLON     { printf("Result = %g\n", $1); }
    ;

expr:
      NUMBER                         { $$ = $1; }
    | expr PLUS expr                 { $$ = $1 + $3; }
    | expr MINUS expr                { $$ = $1 - $3; }
    | expr MULTIPLY expr             { $$ = $1 * $3; }
    | expr DIVIDE expr               { $$ = $1 / $3; }
    | expr MODULO expr               { $$ = fmod($1, $3); }
    | expr POWER expr                { $$ = pow($1, $3); }
    | MINUS expr %prec UMINUS        { $$ = -$2; }
    | LPAREN expr RPAREN             { $$ = $2; }
    ;

%%

int main() {
    printf("Enter expressions:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}
