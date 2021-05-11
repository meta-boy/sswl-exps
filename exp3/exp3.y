%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
%}

%token ID NUMBER
%left '+' '-'
%left '*' '/'
%%

stmt:expr ;
expr: expr '+' expr
|expr '-' expr
|expr '*' expr
|expr '/' expr
|expr '=' expr
|'('expr')'
|NUMBER
|ID;
%%
int main(void)
{
printf("Enter expr: \n");
yyparse();
printf("valid exp");
return 0;
}
int yyerror(void)
{
printf("invalid expression");
exit(1);
}