%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
%}

%union
{
	int intval;
	float floatval;
}

%token <intval> NUMI
%token <floatval> NUMF
%token SIN COS TAN SQRT LOG 
%type <floatval> expr
%type <floatval> s
%left '+' '-' 
%left '*' '/'
%left '(' ')'
%%

s	:	expr						{ printf("Answer = %.2f\n", $$); }
	;
	
expr	:	expr'+'expr			{$$ = $1 + $3;}
    |		expr'-'expr			{$$ = $1 - $3;}
    |		expr'*'expr			{$$ = $1 * $3;}
    |		expr'/'expr			{$$ = $1 / $3;}
	|		'('expr')'			{ $$ = $2; }
	|		SIN'('expr')'   	{$$=sin($3);}
    |		COS'('expr')'   	{$$=cos($3);}
    |		TAN'('expr')'   	{$$=tan($3);}
	|		LOG'('expr')'   	{$$=log($3);}
    |		SQRT'('expr')'  	{$$=sqrt($3);}
	|	NUMI						{ $$ = $1; }
	|	NUMF						{ $$ = $1; }
	;
	
	
%%
int main()
{
	printf("Enter expression: \n");
	yyparse();
}

int yyerror()
{
	printf("Syntax error\n");
	exit(0);
}