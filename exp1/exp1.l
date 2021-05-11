%{
int lines=0,sp=0,other=0,c=0,num=0;
%}

%%
\n   {lines++;}
[' ']   {sp++;}
[A-z] {c++;}
[0-9]  {num++;}
.      {other++;}
%%

int main()
{
yyin=fopen("abc.txt","r");
yylex();
printf("\n Lines=%d",lines);
printf("\n spaces=%d",sp);
printf("\n Other=%d",other);
printf("\n characters=%d",c);
printf("\n Number=%d",num);
}

int yywrap()
{
  return 1;
}
