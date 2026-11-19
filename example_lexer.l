%{
    #include <stdio.h>
    #include <stdlib.h>    
%}

%%
25[0-9]*[00] {printf("Accepted\n");}
[0-9]* {printf("Rejected\n");}
. {printf("Lexer error\n");}
%%

int yywrap(){}

int main(){
    printf("Input: ");
    yylex();
    return 0;
}