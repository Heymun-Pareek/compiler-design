In our semester course we learnt about compilers such as working with lex and yacc and covered the various phases of compiler from lexical analysis, syntax analysis, semantic analysis, intermediate code generation, code optimization and code generation.
I found some topics very interesting such as IR and how many languages can have one or similar IR structure with a few changes depending on the architecture and how there can also be multiple IRs depending on the level. Additionally in code optimization - techniques like dead code algebraic simplification, constant folding, copy propogation and dead code elimination were also very interesting to learn about. Overall I was very happy to learn about the most direct application to automata theory in this course.

To compile the above lex and yacc files:
- win_bison -d parser.y (generates parser.tab.h file that is to be used in linker)
- win_flex lexer.l (make sure this lexer file has parser.tab.h included generates lex.yy.c)
- gcc lex.yy.c parser.tab.c -o app.exe
